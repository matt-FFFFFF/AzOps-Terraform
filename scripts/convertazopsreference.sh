#!/bin/bash
set -e

usage() { 
  echo "Usage: $0 [-r <refdir>] [-o <outdir>]" 1>&2; exit 1;
}

exit_abnormal() {
  usage
  exit 1
}

generate_tf_name() {
  local TFNAME=""
  TFNAME=$(echo $1 \
          | sed "s/Microsoft.Authorization_$2-//" \
          | sed 's/.parameters.json//' \
          | sed 's/-/_/g' \
          | tr '[:upper:]' '[:lower:]')
  if [ "$TFNAME" == "" ]; then
    echo "Could not generate out file name from $1" 1>&2
    exit_abnormal
  fi
  echo $TFNAME
}

create_tf_def_file() {
  local POLICYNAME=$(echo $POLICYJSON | jq -r '.parameters.input.value.Name')
  local POLICYDISPLAYNAME=$(echo $POLICYJSON | jq -r '.parameters.input.value.Properties.DisplayName')
  local POLICYDESCRIPTION=$(echo $POLICYJSON | jq -r '.parameters.input.value.Properties.Description')
  local POLICYMODE=$(echo $POLICYJSON | jq -r '.parameters.input.value.Properties.Mode')
  local POLICYPARAMETERS=$(echo $POLICYJSON | jq '.parameters.input.value.Properties.Parameters')
  if [ ! "$POLICYPARAMETERS" == "{}" ] && [ ! "$POLICYPARAMETERS" == "null" ]; then
    POLICYPARAMETERS="parameters            = var.policydefinition_$1_parameters"
  else
    POLICYPARAMETERS=""
  fi

  cat << EOF >$OUTDIR/policydefinition-${1}.tf
resource "azurerm_policy_definition" "${1}" {
  name                  = "$POLICYNAME"
  policy_type           = "Custom"
  mode                  = "$POLICYMODE"
  display_name          = "$POLICYDISPLAYNAME"
  description           = "$POLICYDESCRIPTION"

  management_group_name = azurerm_management_group.es.name
  policy_rule           = var.policydefinition_$1_policyrule
  $POLICYPARAMETERS
}

variable "policydefinition_$1_policyrule" {
    type = string
}

variable "policydefinition_$1_parameters" {
    type    = string
    default = ""
}
EOF
}

create_tfvars_def_file() {
  cat << EOF >$OUTDIR/policydefinition-${1}.auto.tfvars
policydefinition_${1}_policyrule = <<POLICYRULE
$(echo $POLICYJSON | jq '.parameters.input.value.properties.policyrule')
POLICYRULE

EOF
  local PARAMETERS=$(echo $POLICYJSON | jq '.parameters.input.value.Properties.Parameters')
  if [ ! "$PARAMETERS" == "{}" ] && [ ! "$PARAMETERS" == "null" ]; then
    cat << EOF >>$OUTDIR/policydefinition-${1}.auto.tfvars
policydefinition_${1}_parameters = <<PARAMETERS
$PARAMETERS
PARAMETERS

EOF
  fi
}

create_tf_setdef_file() {
  local POLICYSETNAME=$(echo $POLICYJSON | jq -r '.parameters.input.value.Name')
  local POLICYSETDISPLAYNAME=$(echo $POLICYJSON | jq -r '.parameters.input.value.Properties.DisplayName')
  local POLICYSETDESCRIPTION=$(echo $POLICYJSON | jq -r '.parameters.input.value.Properties.Description')
  local POLICYSETPARAMETERS=$(echo $POLICYJSON | jq '.parameters.input.value.Properties.Parameters')
  local POLICYSETDEPS=$(for dep in `echo $POLICYJSON \
                        | jq -r '.parameters.input.value.Properties.PolicyDefinitions[].policyDefinitionId' \
                        | cut -d / -f 9 \
                        | sort \
                        | tr '[:upper:]' '[:lower:]' \
                        | sed 's/-/_/g'`; do \
                            echo "    "azurerm_policy_definition.$dep,; \
                        done)
  if [ ! "$POLICYSETPARAMETERS" == "{}" ] && [ ! "$POLICYSETPARAMETERS" == "null" ]; then
    POLICYSETPARAMETERS="parameters          = var.policysetdefinition_$1_parameters"
  else
    POLICYSETPARAMETERS=""
  fi
    cat << EOF >$OUTDIR/policysetdefinition-${1}.tf
resource "azurerm_policy_set_definition" "${1}" {
  name                = "$POLICYSETNAME"
  policy_type         = "Custom"
  display_name        = "$POLICYSETDISPLAYNAME"
  description         = "$POLICYSETDESCRIPTION"
  management_group_id = azurerm_management_group.es.name
  depends_on          = [
$POLICYSETDEPS
  ]
  policy_definitions  = var.policysetdefinition_${1}_policydefinitions
  $POLICYSETPARAMETERS
}

variable "policysetdefinition_${1}_policydefinitions" {
  type = string
}

variable "policysetdefinition_$1_parameters" {
  type    = string
  default = ""
}
EOF
}

create_tfvars_setdef_file() {
  cat << EOF >$OUTDIR/policysetdefinition-${1}.auto.tfvars
policysetdefinition_${1}_policydefinitions = <<POLICYDEFINITIONS
$(echo $POLICYJSON | jq '.parameters.input.value.Properties.PolicyDefinitions')
POLICYDEFINITIONS

EOF
  local PARAMETERS=$(echo $POLICYJSON | jq '.parameters.input.value.Properties.Parameters')
  if [ ! "$PARAMETERS" == "{}" ] && [ ! "$PARAMETERS" == "null" ]; then
    cat << EOF >>$OUTDIR/policysetdefinition-${1}.auto.tfvars
policysetdefinition_${1}_parameters = <<PARAMETERS
$PARAMETERS
PARAMETERS

EOF
  fi
}

while getopts ":r:o:" o; do
    case "${o}" in
        r)
            REFDIR=${OPTARG}
            ;;
        o)
            OUTDIR=${OPTARG}
            ;;
        *)
            usage
            ;;
    esac
done
shift $((OPTIND-1))

# check params
if [ ! -d "${REFDIR}" ]; then
  echo "Could not find $REFDIR" 1>&2
  exit_abnormal
fi

if [ -z "${OUTDIR}" ]; then
  echo "Output directory not specified" 1>&2
  exit_abnormal
else
  mkdir -p ${OUTDIR} || exit_abnormal
fi

# Ensure we have the necessary tools
COMMANDS="jq tr"
for COMMAND in $COMMANDS; do
  if [ ! $(command -v $COMMAND) ]; then
    echo "Could not find '$COMMAND' command. Is it installed?"
    exit_abnormal
  fi
done

POLICYDEFINITIONS=$(find $REFDIR -iname *policyDefinitions*)

for PD in $POLICYDEFINITIONS; do
  PDBASE=$(basename $PD)
  echo "Converting: $PDBASE"
  POLICYJSON=$(jq 'def recurse_remove_null: walk( if type == "object" then with_entries( select( .value != null ) ) else . end); recurse_remove_null | .' $PD)
  TFNAME=$(generate_tf_name $PDBASE policyDefinitions)
  create_tf_def_file $TFNAME
  create_tfvars_def_file $TFNAME
done

POLICYSETDEFINITIONS=$(find $REFDIR -iname *policySetDefinitions*)

for PSD in $POLICYSETDEFINITIONS; do
  PSDBASE=$(basename $PSD)
  echo "Converting: $PSDBASE"
  POLICYJSON=$(jq 'def recurse_remove_null: walk( if type == "object" then with_entries( select( .value != null ) ) else . end); recurse_remove_null | .' $PSD)
  TFNAME=$(generate_tf_name $PSDBASE policySetDefinitions)
  create_tf_setdef_file $TFNAME
  create_tfvars_setdef_file $TFNAME
done

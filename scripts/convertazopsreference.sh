#!/bin/bash
set -e

export MANAGEMENTGROUPNAMEREFERENCE="var.management_group_name"

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
    local POLICYPARAMETERLINE="  parameters            = <<PARAMETERS
$POLICYPARAMETERS
PARAMETERS
"
  else
    local POLICYPARAMETERLINE=""
  fi

  cat << EOF >$OUTDIR/policydefinition-${1}.tf
resource "azurerm_policy_definition" "${1}" {
  name                  = "$POLICYNAME"
  policy_type           = "Custom"
  mode                  = "$POLICYMODE"
  display_name          = "$POLICYDISPLAYNAME"
  description           = "$POLICYDESCRIPTION"

  management_group_name = $MANAGEMENTGROUPNAMEREFERENCE
  policy_rule           = <<POLICYRULE
$(echo $POLICYJSON | jq '.parameters.input.value.Properties.PolicyRule')
POLICYRULE

$POLICYPARAMETERLINE
}

output "policydefinition_$1" {
  value = azurerm_policy_definition.$1
}

EOF
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
    local POLICYSETPARAMETERLINE="parameters          = <<PARAMETERS
$POLICYSETPARAMETERS
PARAMETERS"
  else
    local POLICYSETPARAMETERLINE=""
  fi
    cat << EOF >$OUTDIR/policysetdefinition-${1}.tf
resource "azurerm_policy_set_definition" "${1}" {
  name                = "$POLICYSETNAME"
  policy_type         = "Custom"
  display_name        = "$POLICYSETDISPLAYNAME"
  description         = "$POLICYSETDESCRIPTION"
  management_group_id = $MANAGEMENTGROUPNAMEREFERENCE
  depends_on          = [
$POLICYSETDEPS
  ]
  policy_definitions  = <<POLICYDEFINITIONS
$(echo $POLICYJSON | jq '.parameters.input.value.Properties.PolicyDefinitions')
POLICYDEFINITIONS
  $POLICYSETPARAMETERLINE
}

output "policysetdefinition_$1" {
  value = azurerm_policy_set_definition.$1
}

EOF
}

process_policydef() {
  local PDBASE=$(basename $1)
  echo "Converting: $PDBASE"
  local POLICYJSON=$(jq 'def recurse_remove_null: walk( if type == "object" then with_entries( select( .value != null ) ) else . end); recurse_remove_null | .' $1)
  local TFNAME=$(generate_tf_name $PDBASE policyDefinitions)
  local POLICYNAME=$(echo $POLICYJSON | jq -r '.parameters.input.value.Name')
  local POLICYDISPLAYNAME=$(echo $POLICYJSON | jq -r '.parameters.input.value.Properties.DisplayName')
  local POLICYDESCRIPTION=$(echo $POLICYJSON | jq -r '.parameters.input.value.Properties.Description')
  local POLICYMODE=$(echo $POLICYJSON | jq -r '.parameters.input.value.Properties.Mode')
  local POLICYPARAMETERS=$(echo $POLICYJSON | jq '.parameters.input.value.Properties.Parameters')
  if [ ! "$POLICYPARAMETERS" == "{}" ] && [ ! "$POLICYPARAMETERS" == "null" ]; then
    local POLICYPARAMETERLINE="  parameters            = <<PARAMETERS
$POLICYPARAMETERS
PARAMETERS
"
  else
    local POLICYPARAMETERLINE=""
  fi

  cat << EOF >$2/policydefinition-${TFNAME}.tf
resource "azurerm_policy_definition" "${TFNAME}" {
  name                  = "$POLICYNAME"
  policy_type           = "Custom"
  mode                  = "$POLICYMODE"
  display_name          = "$POLICYDISPLAYNAME"
  description           = "$POLICYDESCRIPTION"

  management_group_name = $MANAGEMENTGROUPNAMEREFERENCE
  policy_rule           = <<POLICYRULE
$(echo $POLICYJSON | jq '.parameters.input.value.Properties.PolicyRule')
POLICYRULE

$POLICYPARAMETERLINE
}

output "policydefinition_$TFNAME" {
  value = azurerm_policy_definition.$TFNAME
}

EOF
}

process_policysetdef() {
  local PSDBASE=$(basename $1)
  echo "Converting: $PSDBASE"
  local POLICYJSON=$(jq 'def recurse_remove_null: walk( if type == "object" then with_entries( select( .value != null ) ) else . end); recurse_remove_null | .' $1)
  local TFNAME=$(generate_tf_name $PSDBASE policySetDefinitions)
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
    local POLICYSETPARAMETERLINE="parameters          = <<PARAMETERS
$POLICYSETPARAMETERS
PARAMETERS"
  else
    local POLICYSETPARAMETERLINE=""
  fi
    cat << EOF >$2/policysetdefinition-${TFNAME}.tf
resource "azurerm_policy_set_definition" "${TFNAME}" {
  name                = "$POLICYSETNAME"
  policy_type         = "Custom"
  display_name        = "$POLICYSETDISPLAYNAME"
  description         = "$POLICYSETDESCRIPTION"
  management_group_id = $MANAGEMENTGROUPNAMEREFERENCE
  depends_on          = [
$POLICYSETDEPS
  ]
  policy_definitions  = <<POLICYDEFINITIONS
$(echo $POLICYJSON | jq '.parameters.input.value.Properties.PolicyDefinitions')
POLICYDEFINITIONS
  $POLICYSETPARAMETERLINE
}

output "policysetdefinition_$TFNAME" {
  value = azurerm_policy_set_definition.$TFNAME
}

EOF
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

export -f generate_tf_name
export -f process_policydef
export -f process_policysetdef

#POLICYDEFINITIONS=$(find $REFDIR -iname *policyDefinitions*)

#for PD in $POLICYDEFINITIONS; do
#  PDBASE=$(basename $PD)
#  echo "Converting: $PDBASE"
#  POLICYJSON=$(jq 'def recurse_remove_null: walk( if type == "object" then with_entries( select( .value != null ) ) else . end); recurse_remove_null | .' $PD)
#  TFNAME=$(generate_tf_name $PDBASE policyDefinitions)
#  create_tf_def_file $TFNAME
#  #create_tfvars_def_file $TFNAME
#done

find $REFDIR -iname *policyDefinitions* | xargs -I % -n 1 -P 10 bash -c "process_policydef % $OUTDIR"

find $REFDIR -iname *policySetDefinitions* | xargs -I % -n 1 -P 10 bash -c "process_policysetdef % $OUTDIR"


if [ $(command -v terraform) ]; then
  echo "Terraform executable found, running fmt"
  terraform fmt -list=false $OUTDIR
fi

unset MANAGEMENTGROUPNAMEREFERENCE
unset -f generate_tf_name
unset -f process_policydef
unset -f process_policysetdef

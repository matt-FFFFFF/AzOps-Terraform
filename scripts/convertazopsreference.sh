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
          | sed 's/Microsoft.Authorization_policyDefinitions-//' \
          | sed 's/.parameters.json//' \
          | sed 's/-/_/g' \
          | tr '[:upper:]' '[:lower:]')
  if [ "$TFNAME" == "" ]; then
    echo "Could not generate out file name from $1" 1>&2
    exit_abnormal
  fi
  echo $TFNAME
}

create_tf_file() {
  local POLICYNAME=$(echo $POLICYJSON | jq -r '.parameters.input.value.name')
  local POLICYDISPLAYNAME=$(echo $POLICYJSON | jq -r '.parameters.input.value.properties.displayname')
  local POLICYDESCRIPTION=$(echo $POLICYJSON | jq -r '.parameters.input.value.properties.description')
  local POLICYMODE=$(echo $POLICYJSON | jq -r '.parameters.input.value.properties.mode')
  local POLICYPARAMETERS=$(echo $POLICYJSON | jq '.parameters.input.value.properties.parameters')
  if [ ! "$POLICYPARAMETERS" == "{}" ] && [ ! "$POLICYPARAMETERS" == "null" ]; then
    POLICYPARAMETERS="policy_parameters     = var.policyDefinition-$1-parameters"
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

create_tfvars_file() {
  cat << EOF >$OUTDIR/policydefinition-${1}.auto.tfvars
policydefinition_${1}_policyrule = <<POLICYRULE
$(echo $POLICYJSON | jq '.parameters.input.value.properties.policyrule')
POLICYRULE

EOF
  local PARAMETERS=$(echo $POLICYJSON | jq '.parameters.input.value.properties.parameters')
  if [ ! "$PARAMETERS" == "{}" ] && [ ! "$PARAMETERS" == "null" ]; then
    cat << EOF >>$OUTDIR/policydefinition-${1}.auto.tfvars
policydefinition_${1}_parameters = <<PARAMETERS
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

for POLICYDEFINITION in $POLICYDEFINITIONS; do
  POLICYDEFINITIONBASE=$(basename $POLICYDEFINITION)
  echo "Converting: $POLICYDEFINITIONBASE"
  POLICYJSON=$(jq 'def recurse_key_rename: walk( if type == "object" then with_entries( .key |= ascii_downcase ) else . end); recurse_key_rename | .' $POLICYDEFINITION)
  TFNAME=$(generate_tf_name $POLICYDEFINITIONBASE)
  create_tf_file $TFNAME
  create_tfvars_file $TFNAME
done
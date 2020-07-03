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
  TFNAME=$(echo $1 | sed 's/Microsoft.Authorization_policyDefinitions-//')
  TFNAME=$(echo $TFNAME | sed 's/.parameters.json//')
  if [ "$TFNAME" == "" ]; then
    echo "Could not generate out file name from $1" 1>&2
    exit_abnormal
  fi
  echo $TFNAME
}

create_tf_file() {
  cat << EOF >$OUTDIR/policydefinition-${1}.tf
variable "policyDefinition-$1-policyrule" {
    type = string
}

variable "policyDefinition-$1-parameters" {
    type = string
}
EOF
}

create_tfvars_file() {
  cat << EOF >$OUTDIR/policydefinition-${1}.auto.tfvars
policyDefinition-${1}-policyrule = <<POLICYRULE
$(jq 'def recurse_key_rename: walk( if type == "object" then with_entries( .key |= ascii_downcase ) else . end); recurse_key_rename | .parameters.input.value.properties.policyrule' $2)
POLICYRULE

EOF
  local PARAMETERS=$(jq 'def recurse_key_rename: walk( if type == "object" then with_entries( .key |= ascii_downcase ) else . end); recurse_key_rename | .parameters.input.value.properties.parameters' $2)
  if [ ! "$PARAMETERS" == "{}" ] && [ ! "$PARAMETERS" == "null" ]; then
    cat << EOF >>$OUTDIR/policydefinition-${1}.auto.tfvars
policyDefinition-${1}-parameters = <<PARAMETERS
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
COMMANDS="jq"
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
  TFNAME=$(generate_tf_name $POLICYDEFINITIONBASE)
  create_tf_file $TFNAME
  create_tfvars_file $TFNAME $POLICYDEFINITION
done
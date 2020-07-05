#!/bin/bash

if [ "$1" ]; then
  echo "Changing policyDefinitions refs to: $1"
  find . -iname *policyset*.tfvars | xargs -n 1 -P 3 sed -i 's/\/ES\//\/${1}\//g'
else
  echo "Usage: $0 <newmanagementgroupId>"
fi

echo "Done."

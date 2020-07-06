#!/bin/bash

if [ "$1" ]; then
  echo "Changing policyDefinitions refs to: $1"
  find . -iname \*policyset\*.tf | xargs -n 1 -P 3 sed -i "s/\/ES\//\/${1}\//g"
else
  echo "Usage: $0 <newManagementGroupId>" 1>&2
  echo "e.g. $0 ES-MyCompany" 1>&2
  exit 1
fi

echo "Done."

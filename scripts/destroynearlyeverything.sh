#!/bin/bash

# Script to clean up after Enterprise-Scale - DO NOT RUN IN PRODUCTION

echo "THIS SCRIPT WILL DESTROY YOUR AZURE ENVIRONMENT"
read -n 4 -p "Are you SURE you want to do this? (type 'yes' to continue): " YES

if [ ! "$YES" == "yes" ]; then
  echo "Confirmation denied - quitting"
  exit 0
fi

TENANT_ID=$(az account list | jq -r '.[] | select(.isDefault) | .tenantId')



recurse_delete_mg() {
  echo "Recurse delete $1"
  az account management-group show --name $1 \
                                   --expand \
                                   | jq '.children[] | select(.type=="/providers/Microsoft.Management/managementGroups") | .name' \
                                   | xargs -n 1 -P 5 -I % bash -c "recurse_delete_mg %"
  az account management-group delete --name $1
}


echo 'Moving subscriptions into root management group'
az account list --refresh --all | jq -r '.[].id' | xargs -n 1 -P 5 az account management-group subscription add --name $TENANT_ID --subscription

echo 'Removing tenant deployments'
az deployment tenant list | \
  jq -r '.[].name' | \
  xargs -n 1 -P 10 az deployment tenant delete --name


echo "Removing service principals"
for n in  "${SP_NAMES[@]}"; do 
  echo az ad sp delete --id http://$n
done

export -f recurse_delete_mg

echo "Removing management groups"
az account management-group show --name $TENANT_ID \
                                 --expand \
                                | jq -r '.children | .[] | select(.type=="/providers/Microsoft.Management/managementGroups") | .name' \
                                | xargs -n 1 -P 5 -I % bash -c "recurse_delete_mg %"

unset -f recurse_delete_mg

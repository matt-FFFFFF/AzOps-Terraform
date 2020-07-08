#!/bin/bash

set -e

# Defaults
LOCATION='westeurope'
SP_NAME='AzOpsTF'
SP_ACTION_NAME='AzOpsAction'
SP_ROOT_ROLE_ASSIGNMENT='Management Group Contributor'
TF_RG_NAME='ES-tf'
TF_STATE_FILE_NAME='es.tfstate'
TF_RANDOM_NAME="estf$RANDOM$RANDOM"
TF_STORAGE_ACCT_SKU='Standard_GZRS'
TF_STORAGE_CONTAINER_NAME="tfbackend"

usage() {
  echo "Usage: $0" 1>&2
  exit 1
}

exit_abnormal() {
  echo $1 1>&2
  usage
}

SUBSCRIPTION=$(az account list --query '[?isDefault]' --output json)
SUBSCRIPTION_ID=$(echo $SUBSCRIPTION | jq -r .[].id)
echo "Using subscription id: $(echo $SUBSCRIPTION | jq -r '.[].id')"
echo "Using location: $LOCATION"

if [ ! "$SUBSCRIPTION_ID" ]; then
  exit_abnormal 'Not logged in with az cli or no subscriptions'
fi

# Create backend.hcl
cp -f backend.hcl.example backend.hcl
sed -i "s/myrg/$TF_RG_NAME/" backend.hcl
sed -i "s/mystorageaccount/$TF_RANDOM_NAME/" backend.hcl
sed -i "s/mystatecontainer/$TF_STORAGE_CONTAINER_NAME/" backend.hcl
sed -i "s/mybackendkey.tfstate/$TF_STATE_FILE_NAME/" backend.hcl

ADMIN_USER=$(az ad signed-in-user show --output json)

# Configure az cli for silent output and defaults
export AZURE_CORE_OUTPUT=none
az configure --defaults group=$TF_RG_NAME location=$LOCATION \
             --scope local

echo "Creating resource group $TF_RG_NAME"
az group create --name $TF_RG_NAME 

echo "Creating service principal and assigning $SP_ROOT_ROLE_ASSIGNMENT role at tenant root scope '/'"
SP=$(az ad sp create-for-rbac -n $SP_NAME \
                               --role "$SP_ROOT_ROLE_ASSIGNMENT" \
                               --scopes '/' \
                               --output json)

echo "Creating service principal and assigning Reader role at resource group: $TF_RG_NAME"
SP_ACTION=$(az ad sp create-for-rbac -n $SP_ACTION_NAME \
                               --role "Reader" \
                               --scopes "/subscriptions/$SUBSCRIPTION_ID/resourceGroups/$TF_RG_NAME" \
                               --sdk-auth \
                               --output json)

echo "Waiting for the new service principals to appear in the Azure AD Graph"
while [ ! "$SP_OBJECT" ] || [ ! "$SP_ACTION_OBJECT" ]; do
  printf '.'
  SP_OBJECT=$(az ad sp show --id "http://$SP_NAME" --output json)
  SP_ACTION_OBJECT=$(az ad sp show --id "http://$SP_ACTION_NAME" --output json)
  sleep 5
done
printf '\n'

echo "Creating storage account $TF_RANDOM_NAME"
az storage account create --name $TF_RANDOM_NAME \
                          --https-only \
                          --kind StorageV2 \
                          --sku $TF_STORAGE_ACCT_SKU

echo "Adding 'Reader and Data Access' role assignment on storage account for SPN"
az role assignment create --role 'Reader and Data Access' \
                          --assignee-object-id $(echo $SP_OBJECT | jq -r .objectId) \
                          --assignee-principal-type ServicePrincipal \
                          --scope "/subscriptions/$SUBSCRIPTION_ID/resourceGroups/$TF_RG_NAME/providers/Microsoft.Storage/storageAccounts/$TF_RANDOM_NAME"

echo "Adding 'Owner' role assignment for SPN on the subscription for SPN"
az role assignment create --role 'Owner' \
                          --assignee-object-id $(echo $SP_OBJECT | jq -r .objectId) \
                          --assignee-principal-type ServicePrincipal \
                          --scope "/subscriptions/$SUBSCRIPTION_ID"


echo "Adding 'Storage Blob Data Contributor' role assignment for $(echo $ADMIN_USER | jq -r .userPrincipalName)"
TOBEREMOVED=$(az role assignment create --role 'Storage Blob Data Contributor' \
                          --assignee-object-id $(echo $ADMIN_USER | jq -r .objectId) \
                          --assignee-principal-type User \
                          --scope "/subscriptions/$SUBSCRIPTION_ID/resourceGroups/$TF_RG_NAME/providers/Microsoft.Storage/storageAccounts/$TF_RANDOM_NAME" \
                          --output json)

echo "Creating blob container for Terraform backend"
az storage container create --account-name $TF_RANDOM_NAME \
                            --auth-mode login \
                            --name $TF_STORAGE_CONTAINER_NAME

echo "Creating key vault $TF_RANDOM_NAME"
az keyvault create --name $TF_RANDOM_NAME

echo "Adding key vault access policy for $(echo $ADMIN_USER | jq -r .userPrincipalName)"
az keyvault set-policy --name $TF_RANDOM_NAME \
                       --object-id $(echo $ADMIN_USER | jq -r .objectId) \
                       --secret-permissions get list set

echo "Adding kay vault access policy for action/pipeline service principal"
az keyvault set-policy --name $TF_RANDOM_NAME \
                       --object-id $(echo $SP_ACTION_OBJECT | jq -r .objectId) \
                       --secret-permissions get list

echo "Creating secrets: arm-client-id, arm-client-secret, arm-tenant-id, arm-subscription-id & tf-backend-file"
az keyvault secret set --vault-name $TF_RANDOM_NAME \
                --name arm-client-id \
                --value $(echo $SP | jq -r .appId)
az keyvault secret set --vault-name $TF_RANDOM_NAME \
                --name arm-client-secret \
                --value $(echo $SP | jq -r .password)
az keyvault secret set --vault-name $TF_RANDOM_NAME \
                --name arm-subscription-id \
                --value $SUBSCRIPTION_ID
az keyvault secret set --vault-name $TF_RANDOM_NAME \
                --name arm-tenant-id \
                --value $(echo $SUBSCRIPTION | jq -r '.[].tenantId')
az keyvault secret set --vault-name $TF_RANDOM_NAME \
                --name tf-backend-file \
                --value $(cat backend.hcl)

echo "Removing key vault access policy for $(echo $ADMIN_USER | jq -r .userPrincipalName)"
az keyvault delete-policy --name $TF_RANDOM_NAME \
                       --object-id $(echo $ADMIN_USER | jq -r .objectId)

az configure --defaults group='' location='' \
             --scope local

echo "Removing 'Storage Blob Data Contributor' role assignment for $(echo $ADMIN_USER | jq -r .userPrincipalName)"
az role assignment delete --ids $(echo $TOBEREMOVED | jq -r .id )


echo "You will need to create the following secrets in GitHub or Azure Devops"
echo
echo "AZURE_CREDENTIALS:"
echo "-------------------------------"
echo $SP_ACTION | jq
echo "-------------------------------"
echo 
echo "KEYVAULT_NAME:"
echo "-------------------------------"
echo $TF_RANDOM_NAME
echo "-------------------------------"


#TODO #14

unset AZURE_CORE_OUTPUT

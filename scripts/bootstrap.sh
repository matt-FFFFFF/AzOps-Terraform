#!/bin/bash

set -e

# Defaults
LOCATION='westeurope'
SP_NAME='AzOpsTF'
SP_ROOT_ROLE_ASSIGNMENT='Management Group Contributor'
TF_RG_NAME='ES-tf'
TF_STATE_FILE_NAME='es.tfstate'
TF_STORAGE_ACCT_NAME="estf$RANDOM$RANDOM"
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

SUBSCRIPTION_ID=$(az account list --query '[?isDefault].id' --output tsv)
echo "Using subscription id: $SUBSCRIPTION_ID"
echo "Using location: $LOCATION"

if [ ! $SUBSCRIPTION_ID ]; then
  exit_abnormal 'Not logged in with az cli or no subscriptions'
  usage
  exit 1
fi

ADMIN_USER=$(az ad signed-in-user show --output json)

# Configure az cli for silent output and defaults
export AZURE_CORE_OUTPUT=none
az configure --defaults group=$TF_RG_NAME location=$LOCATION \
             --scope local

echo "Creating service principal and assigning $SP_ROOT_ROLE_ASSIGNMENT role at tenant root scope '/'"
SP=$(az ad sp create-for-rbac -n $SP_NAME \
                               --role "$SP_ROOT_ROLE_ASSIGNMENT" \
                               --scopes '/' \
                               --output json)

echo "Waiting for the new SPN to appear in the Azure AD Graph"
while [ ! "$SP_OBJECT" ]; do
  echo '.'
  SP_OBJECT=$(az ad sp show --id "http://$SP_NAME" --output json)
  sleep 5
done


echo "Creating resource group $TF_RG_NAME"
az group create --name $TF_RG_NAME 

echo "Creating storage account $TF_STORAGE_ACCT_NAME"
az storage account create --name $TF_STORAGE_ACCT_NAME \
                          --https-only \
                          --kind StorageV2 \
                          --sku $TF_STORAGE_ACCT_SKU

echo "Adding 'Storage Blob Data Contributor' role assignment for SPN"
az role assignment create --role 'Storage Blob Data Contributor' \
                          --assignee-object-id $(echo $SP_OBJECT | jq -r .objectId) \
                          --assignee-principal-type ServicePrincipal \
                          --scope "/subscriptions/$SUBSCRIPTION_ID/resourceGroups/$TF_RG_NAME/providers/Microsoft.Storage/storageAccounts/$TF_STORAGE_ACCT_NAME"

echo "Adding 'Storage Blob Data Contributor' role assignment for $(echo $ADMIN_USER | jq -r .userPrincipalName)"
TOBEREMOVED=$(az role assignment create --role 'Storage Blob Data Contributor' \
                          --assignee-object-id $(echo $ADMIN_USER | jq -r .objectId) \
                          --assignee-principal-type User \
                          --scope "/subscriptions/$SUBSCRIPTION_ID/resourceGroups/$TF_RG_NAME/providers/Microsoft.Storage/storageAccounts/$TF_STORAGE_ACCT_NAME" \
                          --output json)

echo "Creating blob container for Terraform backend"
az storage container create --account-name $TF_STORAGE_ACCT_NAME \
                            --auth-mode login \
                            --name $TF_STORAGE_CONTAINER_NAME

az configure --defaults group='' location='' \
             --scope local

az role assignment delete --ids $(echo $TOBEREMOVED | jq -r .id )

echo "Creating Terraform backend file"
cp backend.hcl.example backend.hcl
sed -i "s/myrg/$TF_RG_NAME/" backend.hcl
sed -i "s/mystorageaccount/$TF_STORAGE_ACCT_NAME/" backend.hcl
sed -i "s/mystatecontainer/$TF_STORAGE_CONTAINER_NAME/" backend.hcl
sed -i "s/mybackendkey.tfstate/$TF_STATE_FILE_NAME/" backend.hcl


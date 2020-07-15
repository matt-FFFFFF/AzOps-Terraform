# AzOps Terraform

This project is in its early stages but intends to provide an alternate implementation of [Enterprise Scale landing zones](https://github.com/Azure/Enterprise-Scale) and [AzOps](Https://github.com/Azure/AzOps) using Terraform.

The current scope of this project is as follows:

* :white_check_mark: [Enterprise Scale Foundation](https://github.com/Azure/Enterprise-Scale/tree/main/docs/reference/wingtip)
* :black_square_button: Regional hub template (not started)
* :black_square_button: Landing zone template (not started)

## Quick Start

* You will need an Azure subscription and a storage account to use for the backend storage.
This subscription will become your `management` subscription.
Create a container in the storage account to store the Terraform state.

* Click the 'Use this template' button to create a copy of this repo

* Clone the repo locally (or use Visual Studio CodeSpaces)

* Run the `bootstrap.sh` script from the project root directory, this will deploy the required resources to you management subscription and provide you with the service principal details required for the GitHub Action.

```shell
$ scripts/bootstrap.sh
```

The output will look similar to this:

```plain
<snip>
You will need to create the following secrets in GitHub or Azure DevOps

AZURE_CREDENTIALS:
-------------------------------
{
  "clientId": "00000000-0000-0000-0000-000000000000",
  "clientSecret": "<redacted>",
  "subscriptionId": "00000000-0000-0000-0000-000000000000",
  "tenantId": "00000000-0000-0000-0000-000000000000",
  "activeDirectoryEndpointUrl": "https://login.microsoftonline.com",
  "resourceManagerEndpointUrl": "https://management.azure.com/",
  "activeDirectoryGraphResourceId": "https://graph.windows.net/",
  "sqlManagementEndpointUrl": "https://management.core.windows.net:8443/",
  "galleryEndpointUrl": "https://gallery.azure.com/",
  "managementEndpointUrl": "https://management.core.windows.net/"
}
-------------------------------

KEYVAULT_NAME:
-------------------------------
estf00000000
-------------------------------
```

 Using **your** output, create a repository secret called `AZURE_CREDENTIALS` & `KEYVAULT_NAME`

* Run the action/pipeline in `plan` mode to check everything checks out. 

  * In GitHub, use the `workflow_dispatch` capability to do this.
  * In Azure DevOps #TODO [#10](https://github.com/matt-FFFFFF/AzOps-Terraform/issues/10)



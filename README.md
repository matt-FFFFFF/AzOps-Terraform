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

* You will need a Service Principal that has `Management Group Contributor` rights and `Owner` rights on the subscription that you have.
Create environment variables with the SPN credentials:

```shell
export ARM_CLIENT_ID=xxxx
export ARM_CLIENT_SECRET=xxxx
export ARM_SUBSCRIPTION_ID=xxxx
export ARM_TENANT_ID=xxxx
```

* Grant the service principal `Storage Blob Data Contributor` rights to the storage account

* Create a [copy](https://github.com/matt-FFFFFF/AzOps-Terraform/generate) of this repo.

* Create your `backend.hcl` file from the example, this is symlinked into the required folders

* Inside the `tf-0000-platform` folder, run `terraform init`.
This should succeed without errors.

TBC

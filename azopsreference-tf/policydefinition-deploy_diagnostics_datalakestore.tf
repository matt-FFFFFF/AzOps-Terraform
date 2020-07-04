resource "azurerm_policy_definition" "deploy_diagnostics_datalakestore" {
  name                  = "Deploy-Diagnostics-DataLakeStore"
  policy_type           = "Custom"
  mode                  = "All"
  display_name          = "Deploy-Diagnostics-DataLakeStore"
  description           = "Apply diagnostic settings for Data Lake Storage - Log Analytics"

  management_group_name = azurerm_management_group.<changeme>.name
  policy_rule           = var.policyDefinition_deploy_diagnostics_datalakestore_policyrule
  policy_parameters     = var.policyDefinition-deploy_diagnostics_datalakestore-parameters
}


variable "policyDefinition_deploy_diagnostics_datalakestore_policyrule" {
    type = string
}

variable "policyDefinition_deploy_diagnostics_datalakestore_parameters" {
    type    = string
    default = ""
}

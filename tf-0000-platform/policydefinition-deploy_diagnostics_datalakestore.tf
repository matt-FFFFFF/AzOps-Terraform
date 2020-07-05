resource "azurerm_policy_definition" "deploy_diagnostics_datalakestore" {
  name                  = "Deploy-Diagnostics-DataLakeStore"
  policy_type           = "Custom"
  mode                  = "All"
  display_name          = "Deploy-Diagnostics-DataLakeStore"
  description           = "Apply diagnostic settings for Data Lake Storage - Log Analytics"

  management_group_name = azurerm_management_group.es.name
  policy_rule           = var.policydefinition_deploy_diagnostics_datalakestore_policyrule
  parameters            = var.policydefinition_deploy_diagnostics_datalakestore_parameters
}

variable "policydefinition_deploy_diagnostics_datalakestore_policyrule" {
    type = string
}

variable "policydefinition_deploy_diagnostics_datalakestore_parameters" {
    type    = string
    default = ""
}

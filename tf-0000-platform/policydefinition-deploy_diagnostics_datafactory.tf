resource "azurerm_policy_definition" "deploy_diagnostics_datafactory" {
  name                  = "Deploy-Diagnostics-DataFactory"
  policy_type           = "Custom"
  mode                  = "All"
  display_name          = "Deploy-Diagnostics-DataFactory"
  description           = "Apply diagnostic settings for Data Factory - Log Analytics"

  management_group_name = azurerm_management_group.es.name
  policy_rule           = var.policydefinition_deploy_diagnostics_datafactory_policyrule
  parameters            = var.policydefinition_deploy_diagnostics_datafactory_parameters
}

variable "policydefinition_deploy_diagnostics_datafactory_policyrule" {
    type = string
}

variable "policydefinition_deploy_diagnostics_datafactory_parameters" {
    type    = string
    default = ""
}

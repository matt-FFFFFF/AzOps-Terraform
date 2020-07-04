resource "azurerm_policy_definition" "deploy_diagnostics_logicappsise" {
  name                  = "Deploy-Diagnostics-LogicAppsISE"
  policy_type           = "Custom"
  mode                  = "All"
  display_name          = "Deploy-Diagnostics-LogicAppsISE"
  description           = "Apply diagnostic settings for Logic Apps Integration Accounts - Log Analytics"

  management_group_name = azurerm_management_group.es.name
  policy_rule           = var.policydefinition_deploy_diagnostics_logicappsise_policyrule
  policy_parameters     = var.policyDefinition-deploy_diagnostics_logicappsise-parameters
}

variable "policydefinition_deploy_diagnostics_logicappsise_policyrule" {
    type = string
}

variable "policydefinition_deploy_diagnostics_logicappsise_parameters" {
    type    = string
    default = ""
}

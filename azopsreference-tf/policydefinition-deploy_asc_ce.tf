resource "azurerm_policy_definition" "deploy_asc_ce" {
  name                  = "Deploy-ASC-CE"
  policy_type           = "Custom"
  mode                  = "All"
  display_name          = "Deploy-ASC-ContinuousExportToWorkspace"
  description           = "null"

  management_group_name = azurerm_management_group.es.name
  policy_rule           = var.policydefinition_deploy_asc_ce_policyrule
  policy_parameters     = var.policyDefinition-deploy_asc_ce-parameters
}

variable "policydefinition_deploy_asc_ce_policyrule" {
    type = string
}

variable "policydefinition_deploy_asc_ce_parameters" {
    type    = string
    default = ""
}

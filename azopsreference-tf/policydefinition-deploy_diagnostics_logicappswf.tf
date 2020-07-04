resource "azurerm_policy_definition" "deploy_diagnostics_logicappswf" {
  name                  = "Deploy-Diagnostics-LogicAppsWF"
  policy_type           = "Custom"
  mode                  = "All"
  display_name          = "Deploy-Diagnostics-LogicAppsWF"
  description           = "Apply diagnostic settings for Logic Apps workflows - Log Analytics"

  management_group_name = azurerm_management_group.<changeme>.name
  policy_rule           = var.policyDefinition_deploy_diagnostics_logicappswf_policyrule
  policy_parameters     = var.policyDefinition-deploy_diagnostics_logicappswf-parameters
}


variable "policyDefinition_deploy_diagnostics_logicappswf_policyrule" {
    type = string
}

variable "policyDefinition_deploy_diagnostics_logicappswf_parameters" {
    type    = string
    default = ""
}

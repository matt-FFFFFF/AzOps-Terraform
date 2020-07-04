resource "azurerm_policy_definition" "deploy_diagnostics_activitylog" {
  name                  = "Deploy-Diagnostics-ActivityLog"
  policy_type           = "Custom"
  mode                  = "All"
  display_name          = "Deploy-Diagnostics-ActivityLog"
  description           = "Ensures that Activity Log Diagnostics settings are set to push logs into Log Analytics"

  management_group_name = azurerm_management_group.es.name
  policy_rule           = var.policydefinition_deploy_diagnostics_activitylog_policyrule
  parameters            = var.policydefinition_deploy_diagnostics_activitylog_parameters
}

variable "policydefinition_deploy_diagnostics_activitylog_policyrule" {
    type = string
}

variable "policydefinition_deploy_diagnostics_activitylog_parameters" {
    type    = string
    default = ""
}

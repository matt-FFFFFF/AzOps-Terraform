resource "azurerm_policy_definition" "deploy_log_analytics" {
  name         = "Deploy-Log-Analytics"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Deploy-LogAnalytics"
  description  = "null"

  management_group_name = azurerm_management_group.es.name
  policy_rule           = var.policydefinition_deploy_log_analytics_policyrule
  parameters            = var.policydefinition_deploy_log_analytics_parameters
}

variable "policydefinition_deploy_log_analytics_policyrule" {
  type = string
}

variable "policydefinition_deploy_log_analytics_parameters" {
  type    = string
  default = ""
}

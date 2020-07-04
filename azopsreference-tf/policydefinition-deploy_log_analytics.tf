resource "azurerm_policy_definition" "deploy_log_analytics" {
  name                  = "Deploy-Log-Analytics"
  policy_type           = "Custom"
  mode                  = "All"
  display_name          = "Deploy-LogAnalytics"
  description           = "null"

  management_group_name = azurerm_management_group.<changeme>.name
  policy_rule           = var.policyDefinition_deploy_log_analytics_policyrule
  policy_parameters     = var.policyDefinition-deploy_log_analytics-parameters
}


variable "policyDefinition_deploy_log_analytics_policyrule" {
    type = string
}

variable "policyDefinition_deploy_log_analytics_parameters" {
    type    = string
    default = ""
}

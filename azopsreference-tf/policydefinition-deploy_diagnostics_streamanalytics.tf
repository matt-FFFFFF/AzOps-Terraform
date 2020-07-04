resource "azurerm_policy_definition" "deploy_diagnostics_streamanalytics" {
  name                  = "Deploy-Diagnostics-StreamAnalytics"
  policy_type           = "Custom"
  mode                  = "All"
  display_name          = "Deploy-Diagnostics-StreamAnalytics"
  description           = "Apply diagnostic settings for Stream Analytics - Log Analytics"

  management_group_name = azurerm_management_group.<changeme>.name
  policy_rule           = var.policyDefinition_deploy_diagnostics_streamanalytics_policyrule
  policy_parameters     = var.policyDefinition-deploy_diagnostics_streamanalytics-parameters
}


variable "policyDefinition_deploy_diagnostics_streamanalytics_policyrule" {
    type = string
}

variable "policyDefinition_deploy_diagnostics_streamanalytics_parameters" {
    type    = string
    default = ""
}

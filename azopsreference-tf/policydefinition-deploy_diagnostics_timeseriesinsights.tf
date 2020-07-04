resource "azurerm_policy_definition" "deploy_diagnostics_timeseriesinsights" {
  name                  = "Deploy-Diagnostics-TimeSeriesInsights"
  policy_type           = "Custom"
  mode                  = "All"
  display_name          = "Deploy-Diagnostics-TimeSeriesInsights"
  description           = "Apply diagnostic settings for Time Series Insights - Log Analytics"

  management_group_name = azurerm_management_group.<changeme>.name
  policy_rule           = var.policyDefinition_deploy_diagnostics_timeseriesinsights_policyrule
  policy_parameters     = var.policyDefinition-deploy_diagnostics_timeseriesinsights-parameters
}


variable "policyDefinition_deploy_diagnostics_timeseriesinsights_policyrule" {
    type = string
}

variable "policyDefinition_deploy_diagnostics_timeseriesinsights_parameters" {
    type    = string
    default = ""
}

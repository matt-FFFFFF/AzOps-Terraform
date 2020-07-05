resource "azurerm_policy_definition" "deploy_diagnostics_timeseriesinsights" {
  name         = "Deploy-Diagnostics-TimeSeriesInsights"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Deploy-Diagnostics-TimeSeriesInsights"
  description  = "Apply diagnostic settings for Time Series Insights - Log Analytics"

  management_group_name = azurerm_management_group.es.name
  policy_rule           = var.policydefinition_deploy_diagnostics_timeseriesinsights_policyrule
  parameters            = var.policydefinition_deploy_diagnostics_timeseriesinsights_parameters
}

variable "policydefinition_deploy_diagnostics_timeseriesinsights_policyrule" {
  type = string
}

variable "policydefinition_deploy_diagnostics_timeseriesinsights_parameters" {
  type    = string
  default = ""
}

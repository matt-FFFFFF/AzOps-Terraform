resource "azurerm_policy_definition" "deploy_diagnostics_dlanalytics" {
  name                  = "Deploy-Diagnostics-DLAnalytics"
  policy_type           = "Custom"
  mode                  = "All"
  display_name          = "Deploy-Diagnostics-DLAnalytics"
  description           = "Apply diagnostic settings for Data Lake Analytics - Log Analytics"

  management_group_name = azurerm_management_group.es.name
  policy_rule           = var.policydefinition_deploy_diagnostics_dlanalytics_policyrule
  parameters            = var.policydefinition_deploy_diagnostics_dlanalytics_parameters
}

variable "policydefinition_deploy_diagnostics_dlanalytics_policyrule" {
    type = string
}

variable "policydefinition_deploy_diagnostics_dlanalytics_parameters" {
    type    = string
    default = ""
}

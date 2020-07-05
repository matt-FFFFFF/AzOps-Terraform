resource "azurerm_policy_definition" "deploy_diagnostics_analysisservice" {
  name         = "Deploy-Diagnostics-AnalysisService"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Deploy-Diagnostics-AnalysisService"
  description  = "Apply diagnostic settings for Azure Analysis Services - Log Analytics"

  management_group_name = azurerm_management_group.es.name
  policy_rule           = var.policydefinition_deploy_diagnostics_analysisservice_policyrule
  parameters            = var.policydefinition_deploy_diagnostics_analysisservice_parameters
}

variable "policydefinition_deploy_diagnostics_analysisservice_policyrule" {
  type = string
}

variable "policydefinition_deploy_diagnostics_analysisservice_parameters" {
  type    = string
  default = ""
}

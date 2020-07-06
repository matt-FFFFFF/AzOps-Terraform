resource "azurerm_policy_definition" "deploy_diagnostics_powerbiembedded" {
  name         = "Deploy-Diagnostics-PowerBIEmbedded"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Deploy-Diagnostics-PowerBIEmbedded"
  description  = "Apply diagnostic settings for Power BI Embedded - Log Analytics"

  management_group_name = azurerm_management_group.es.name
  policy_rule           = var.policydefinition_deploy_diagnostics_powerbiembedded_policyrule
  parameters            = var.policydefinition_deploy_diagnostics_powerbiembedded_parameters
}

variable "policydefinition_deploy_diagnostics_powerbiembedded_policyrule" {
  type = string
}

variable "policydefinition_deploy_diagnostics_powerbiembedded_parameters" {
  type    = string
  default = ""
}

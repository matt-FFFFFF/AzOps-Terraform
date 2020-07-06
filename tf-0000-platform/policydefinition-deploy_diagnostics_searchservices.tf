resource "azurerm_policy_definition" "deploy_diagnostics_searchservices" {
  name         = "Deploy-Diagnostics-SearchServices"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Deploy-Diagnostics-SearchServices"
  description  = "Apply diagnostic settings for Search Services - Log Analytics"

  management_group_name = azurerm_management_group.es.name
  policy_rule           = var.policydefinition_deploy_diagnostics_searchservices_policyrule
  parameters            = var.policydefinition_deploy_diagnostics_searchservices_parameters
}

variable "policydefinition_deploy_diagnostics_searchservices_policyrule" {
  type = string
}

variable "policydefinition_deploy_diagnostics_searchservices_parameters" {
  type    = string
  default = ""
}

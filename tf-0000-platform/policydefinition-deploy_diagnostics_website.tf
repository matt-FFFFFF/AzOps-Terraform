resource "azurerm_policy_definition" "deploy_diagnostics_website" {
  name         = "Deploy-Diagnostics-Website"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Deploy-Diagnostics-Website"
  description  = "Apply diagnostic settings for Azure Web Sites"

  management_group_name = azurerm_management_group.es.name
  policy_rule           = var.policydefinition_deploy_diagnostics_website_policyrule
  parameters            = var.policydefinition_deploy_diagnostics_website_parameters
}

variable "policydefinition_deploy_diagnostics_website_policyrule" {
  type = string
}

variable "policydefinition_deploy_diagnostics_website_parameters" {
  type    = string
  default = ""
}

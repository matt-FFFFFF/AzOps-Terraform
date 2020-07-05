resource "azurerm_policy_definition" "deploy_diagnostics_applicationgateway" {
  name                  = "Deploy-Diagnostics-ApplicationGateway"
  policy_type           = "Custom"
  mode                  = "All"
  display_name          = "Deploy-Diagnostics-ApplicationGateway"
  description           = "Apply diagnostic settings for Application Gateways - Log Analytics"

  management_group_name = azurerm_management_group.es.name
  policy_rule           = var.policydefinition_deploy_diagnostics_applicationgateway_policyrule
  parameters            = var.policydefinition_deploy_diagnostics_applicationgateway_parameters
}

variable "policydefinition_deploy_diagnostics_applicationgateway_policyrule" {
    type = string
}

variable "policydefinition_deploy_diagnostics_applicationgateway_parameters" {
    type    = string
    default = ""
}

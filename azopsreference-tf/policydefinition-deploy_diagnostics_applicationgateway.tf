resource "azurerm_policy_definition" "deploy_diagnostics_applicationgateway" {
  name                  = "Deploy-Diagnostics-ApplicationGateway"
  policy_type           = "Custom"
  mode                  = "All"
  display_name          = "Deploy-Diagnostics-ApplicationGateway"
  description           = "Apply diagnostic settings for Application Gateways - Log Analytics"

  management_group_name = azurerm_management_group.<changeme>.name
  policy_rule           = var.policyDefinition_deploy_diagnostics_applicationgateway_policyrule
  policy_parameters     = var.policyDefinition-deploy_diagnostics_applicationgateway-parameters
}


variable "policyDefinition_deploy_diagnostics_applicationgateway_policyrule" {
    type = string
}

variable "policyDefinition_deploy_diagnostics_applicationgateway_parameters" {
    type    = string
    default = ""
}

resource "azurerm_policy_definition" "deploy_diagnostics_cdnendpoints" {
  name                  = "Deploy-Diagnostics-CDNEndpoints"
  policy_type           = "Custom"
  mode                  = "All"
  display_name          = "Deploy-Diagnostics-CDNEndpoints"
  description           = "Apply diagnostic settings for CDN Endpoints - Log Analytics"

  management_group_name = azurerm_management_group.es.name
  policy_rule           = var.policydefinition_deploy_diagnostics_cdnendpoints_policyrule
  parameters            = var.policydefinition_deploy_diagnostics_cdnendpoints_parameters
}

variable "policydefinition_deploy_diagnostics_cdnendpoints_policyrule" {
    type = string
}

variable "policydefinition_deploy_diagnostics_cdnendpoints_parameters" {
    type    = string
    default = ""
}

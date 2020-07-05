resource "azurerm_policy_definition" "deploy_diagnostics_expressroute" {
  name                  = "Deploy-Diagnostics-ExpressRoute"
  policy_type           = "Custom"
  mode                  = "All"
  display_name          = "Deploy-Diagnostics-ExpressRoute"
  description           = "Apply diagnostic settings for Express Routes Circuits - Log Analytics"

  management_group_name = azurerm_management_group.es.name
  policy_rule           = var.policydefinition_deploy_diagnostics_expressroute_policyrule
  parameters            = var.policydefinition_deploy_diagnostics_expressroute_parameters
}

variable "policydefinition_deploy_diagnostics_expressroute_policyrule" {
    type = string
}

variable "policydefinition_deploy_diagnostics_expressroute_parameters" {
    type    = string
    default = ""
}

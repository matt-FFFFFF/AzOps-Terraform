resource "azurerm_policy_definition" "deploy_diagnostics_trafficmanager" {
  name                  = "Deploy-Diagnostics-TrafficManager"
  policy_type           = "Custom"
  mode                  = "All"
  display_name          = "Deploy-Diagnostics-TrafficManager"
  description           = "Apply diagnostic settings for Azure Traffic Manager - Log Analytics"

  management_group_name = azurerm_management_group.es.name
  policy_rule           = var.policydefinition_deploy_diagnostics_trafficmanager_policyrule
  parameters            = var.policydefinition_deploy_diagnostics_trafficmanager_parameters
}

variable "policydefinition_deploy_diagnostics_trafficmanager_policyrule" {
    type = string
}

variable "policydefinition_deploy_diagnostics_trafficmanager_parameters" {
    type    = string
    default = ""
}

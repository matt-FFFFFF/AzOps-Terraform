resource "azurerm_policy_definition" "deploy_diagnostics_trafficmanager" {
  name                  = "Deploy-Diagnostics-TrafficManager"
  policy_type           = "Custom"
  mode                  = "All"
  display_name          = "Deploy-Diagnostics-TrafficManager"
  description           = "Apply diagnostic settings for Azure Traffic Manager - Log Analytics"

  management_group_name = azurerm_management_group.<changeme>.name
  policy_rule           = var.policyDefinition_deploy_diagnostics_trafficmanager_policyrule
  policy_parameters     = var.policyDefinition-deploy_diagnostics_trafficmanager-parameters
}


variable "policyDefinition_deploy_diagnostics_trafficmanager_policyrule" {
    type = string
}

variable "policyDefinition_deploy_diagnostics_trafficmanager_parameters" {
    type    = string
    default = ""
}

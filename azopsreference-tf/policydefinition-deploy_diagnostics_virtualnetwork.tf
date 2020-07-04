resource "azurerm_policy_definition" "deploy_diagnostics_virtualnetwork" {
  name                  = "Deploy-Diagnostics-VirtualNetwork"
  policy_type           = "Custom"
  mode                  = "All"
  display_name          = "Deploy-Diagnostics-VirtualNetwork"
  description           = "Apply diagnostic settings for Virtual Networks - Log Analytics"

  management_group_name = azurerm_management_group.es.name
  policy_rule           = var.policydefinition_deploy_diagnostics_virtualnetwork_policyrule
  policy_parameters     = var.policyDefinition-deploy_diagnostics_virtualnetwork-parameters
}

variable "policydefinition_deploy_diagnostics_virtualnetwork_policyrule" {
    type = string
}

variable "policydefinition_deploy_diagnostics_virtualnetwork_parameters" {
    type    = string
    default = ""
}

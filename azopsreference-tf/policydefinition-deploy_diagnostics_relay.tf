resource "azurerm_policy_definition" "deploy_diagnostics_relay" {
  name                  = "Deploy-Diagnostics-Relay"
  policy_type           = "Custom"
  mode                  = "All"
  display_name          = "Deploy-Diagnostics-Relay"
  description           = "Apply diagnostic settings for Azure Relay - Log Analytics"

  management_group_name = azurerm_management_group.<changeme>.name
  policy_rule           = var.policyDefinition_deploy_diagnostics_relay_policyrule
  policy_parameters     = var.policyDefinition-deploy_diagnostics_relay-parameters
}


variable "policyDefinition_deploy_diagnostics_relay_policyrule" {
    type = string
}

variable "policyDefinition_deploy_diagnostics_relay_parameters" {
    type    = string
    default = ""
}

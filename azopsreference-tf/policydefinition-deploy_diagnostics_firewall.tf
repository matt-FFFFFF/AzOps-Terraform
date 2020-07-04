resource "azurerm_policy_definition" "deploy_diagnostics_firewall" {
  name                  = "Deploy-Diagnostics-Firewall"
  policy_type           = "Custom"
  mode                  = "All"
  display_name          = "Deploy-Diagnostics-Firewall"
  description           = "Apply diagnostic settings for Azure Firewalls - Log Analytics"

  management_group_name = azurerm_management_group.<changeme>.name
  policy_rule           = var.policyDefinition_deploy_diagnostics_firewall_policyrule
  policy_parameters     = var.policyDefinition-deploy_diagnostics_firewall-parameters
}


variable "policyDefinition_deploy_diagnostics_firewall_policyrule" {
    type = string
}

variable "policyDefinition_deploy_diagnostics_firewall_parameters" {
    type    = string
    default = ""
}

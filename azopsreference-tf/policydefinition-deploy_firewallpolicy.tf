resource "azurerm_policy_definition" "deploy_firewallpolicy" {
  name                  = "Deploy-FirewallPolicy"
  policy_type           = "Custom"
  mode                  = "All"
  display_name          = "Deploy-FirewallPolicy"
  description           = "Deploys Azure Firewall Policy/Manager"

  management_group_name = azurerm_management_group.<changeme>.name
  policy_rule           = var.policyDefinition_deploy_firewallpolicy_policyrule
  policy_parameters     = var.policyDefinition-deploy_firewallpolicy-parameters
}


variable "policyDefinition_deploy_firewallpolicy_policyrule" {
    type = string
}

variable "policyDefinition_deploy_firewallpolicy_parameters" {
    type    = string
    default = ""
}

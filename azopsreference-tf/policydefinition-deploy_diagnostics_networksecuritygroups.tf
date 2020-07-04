resource "azurerm_policy_definition" "deploy_diagnostics_networksecuritygroups" {
  name                  = "Deploy-Diagnostics-NetworkSecurityGroups"
  policy_type           = "Custom"
  mode                  = "All"
  display_name          = "Deploy-Diagnostics-NetworkSecurityGroups"
  description           = "Apply diagnostic settings for Network Security Groups - Log Analytics"

  management_group_name = azurerm_management_group.<changeme>.name
  policy_rule           = var.policyDefinition_deploy_diagnostics_networksecuritygroups_policyrule
  policy_parameters     = var.policyDefinition-deploy_diagnostics_networksecuritygroups-parameters
}


variable "policyDefinition_deploy_diagnostics_networksecuritygroups_policyrule" {
    type = string
}

variable "policyDefinition_deploy_diagnostics_networksecuritygroups_parameters" {
    type    = string
    default = ""
}

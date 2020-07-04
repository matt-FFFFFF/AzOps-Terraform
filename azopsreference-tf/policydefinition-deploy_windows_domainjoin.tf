resource "azurerm_policy_definition" "deploy_windows_domainjoin" {
  name                  = "Deploy-Windows-DomainJoin"
  policy_type           = "Custom"
  mode                  = "All"
  display_name          = "Deploy-Windows-DomainJoin"
  description           = "null"

  management_group_name = azurerm_management_group.<changeme>.name
  policy_rule           = var.policyDefinition_deploy_windows_domainjoin_policyrule
  policy_parameters     = var.policyDefinition-deploy_windows_domainjoin-parameters
}


variable "policyDefinition_deploy_windows_domainjoin_policyrule" {
    type = string
}

variable "policyDefinition_deploy_windows_domainjoin_parameters" {
    type    = string
    default = ""
}

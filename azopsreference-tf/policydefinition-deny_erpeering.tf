resource "azurerm_policy_definition" "deny_erpeering" {
  name                  = "Deny-ERPeering"
  policy_type           = "Custom"
  mode                  = "All"
  display_name          = "Deny-ERPeering"
  description           = "Denies creation of ER Peerings under the assigned scope."

  management_group_name = azurerm_management_group.<changeme>.name
  policy_rule           = var.policyDefinition_deny_erpeering_policyrule
  
}


variable "policyDefinition_deny_erpeering_policyrule" {
    type = string
}

variable "policyDefinition_deny_erpeering_parameters" {
    type    = string
    default = ""
}

resource "azurerm_policy_definition" "deny_erpeering" {
  name         = "Deny-ERPeering"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Deny-ERPeering"
  description  = "Denies creation of ER Peerings under the assigned scope."

  management_group_name = azurerm_management_group.es.name
  policy_rule           = var.policydefinition_deny_erpeering_policyrule

}

variable "policydefinition_deny_erpeering_policyrule" {
  type = string
}

variable "policydefinition_deny_erpeering_parameters" {
  type    = string
  default = ""
}

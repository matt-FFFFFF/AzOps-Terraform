resource "azurerm_policy_definition" "deny_publicip" {
  name                  = "Deny-PublicIP"
  policy_type           = "Custom"
  mode                  = "All"
  display_name          = "Deny-PublicIP"
  description           = "Denies creation of Public IPs under the assigned scope."

  management_group_name = azurerm_management_group.es.name
  policy_rule           = var.policydefinition_deny_publicip_policyrule
  
}

variable "policydefinition_deny_publicip_policyrule" {
    type = string
}

variable "policydefinition_deny_publicip_parameters" {
    type    = string
    default = ""
}

resource "azurerm_policy_definition" "deny_publicip" {
  name                  = "Deny-PublicIP"
  policy_type           = "Custom"
  mode                  = "All"
  display_name          = "Deny-PublicIP"
  description           = "Denies creation of Public IPs under the assigned scope."

  management_group_name = azurerm_management_group.<changeme>.name
  policy_rule           = var.policyDefinition_deny_publicip_policyrule
  
}


variable "policyDefinition_deny_publicip_policyrule" {
    type = string
}

variable "policyDefinition_deny_publicip_parameters" {
    type    = string
    default = ""
}

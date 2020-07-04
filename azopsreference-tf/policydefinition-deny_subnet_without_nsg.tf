resource "azurerm_policy_definition" "deny_subnet_without_nsg" {
  name                  = "Deny-Subnet-Without-Nsg"
  policy_type           = "Custom"
  mode                  = "All"
  display_name          = "Deny-Subnets-Without-NSG"
  description           = "null"

  management_group_name = azurerm_management_group.<changeme>.name
  policy_rule           = var.policyDefinition_deny_subnet_without_nsg_policyrule
  
}


variable "policyDefinition_deny_subnet_without_nsg_policyrule" {
    type = string
}

variable "policyDefinition_deny_subnet_without_nsg_parameters" {
    type    = string
    default = ""
}

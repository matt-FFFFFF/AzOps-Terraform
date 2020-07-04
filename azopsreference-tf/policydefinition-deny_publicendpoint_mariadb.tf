resource "azurerm_policy_definition" "deny_publicendpoint_mariadb" {
  name                  = "Deny-PublicEndpoint-MariaDB"
  policy_type           = "Custom"
  mode                  = "All"
  display_name          = "Deny-PublicEndpoint-MariaDB"
  description           = "This policy restrict creation of Maria DB accounts with exposed public endpoints"

  management_group_name = azurerm_management_group.<changeme>.name
  policy_rule           = var.policyDefinition_deny_publicendpoint_mariadb_policyrule
  
}


variable "policyDefinition_deny_publicendpoint_mariadb_policyrule" {
    type = string
}

variable "policyDefinition_deny_publicendpoint_mariadb_parameters" {
    type    = string
    default = ""
}

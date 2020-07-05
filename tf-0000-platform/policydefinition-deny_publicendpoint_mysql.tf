resource "azurerm_policy_definition" "deny_publicendpoint_mysql" {
  name                  = "Deny-PublicEndpoint-MySQL"
  policy_type           = "Custom"
  mode                  = "All"
  display_name          = "Deny-PublicEndpoint-MySQL"
  description           = "This policy restrict creation of MySql DB accounts with exposed public endpoints"

  management_group_name = azurerm_management_group.es.name
  policy_rule           = var.policydefinition_deny_publicendpoint_mysql_policyrule
  
}

variable "policydefinition_deny_publicendpoint_mysql_policyrule" {
    type = string
}

variable "policydefinition_deny_publicendpoint_mysql_parameters" {
    type    = string
    default = ""
}

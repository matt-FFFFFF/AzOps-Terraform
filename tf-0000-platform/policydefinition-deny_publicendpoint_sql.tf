resource "azurerm_policy_definition" "deny_publicendpoint_sql" {
  name                  = "Deny-PublicEndpoint-Sql"
  policy_type           = "Custom"
  mode                  = "All"
  display_name          = "Deny-PublicEndpoint-Sql"
  description           = "This policy restrict creation of Sql servers with exposed public endpoints"

  management_group_name = azurerm_management_group.es.name
  policy_rule           = var.policydefinition_deny_publicendpoint_sql_policyrule
  
}

variable "policydefinition_deny_publicendpoint_sql_policyrule" {
    type = string
}

variable "policydefinition_deny_publicendpoint_sql_parameters" {
    type    = string
    default = ""
}

resource "azurerm_policy_definition" "deny_publicendpoint_postgresql" {
  name         = "Deny-PublicEndpoint-PostgreSql"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Deny-PublicEndpoint-PostgreSql"
  description  = "This policy restrict creation of Postgre SQL DB accounts with exposed public endpoints"

  management_group_name = azurerm_management_group.es.name
  policy_rule           = var.policydefinition_deny_publicendpoint_postgresql_policyrule

}

variable "policydefinition_deny_publicendpoint_postgresql_policyrule" {
  type = string
}

variable "policydefinition_deny_publicendpoint_postgresql_parameters" {
  type    = string
  default = ""
}

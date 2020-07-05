resource "azurerm_policy_definition" "deny_publicendpoint_cosmosdb" {
  name         = "Deny-PublicEndpoint-CosmosDB"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Deny-PublicEndpoint-CosmosDB"
  description  = "This policy restrict creation of cosmos db accounts with exposed public endpoints"

  management_group_name = azurerm_management_group.es.name
  policy_rule           = var.policydefinition_deny_publicendpoint_cosmosdb_policyrule

}

variable "policydefinition_deny_publicendpoint_cosmosdb_policyrule" {
  type = string
}

variable "policydefinition_deny_publicendpoint_cosmosdb_parameters" {
  type    = string
  default = ""
}

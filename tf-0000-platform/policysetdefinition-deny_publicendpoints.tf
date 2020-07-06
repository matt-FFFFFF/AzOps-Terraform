resource "azurerm_policy_set_definition" "deny_publicendpoints" {
  name                = "Deny-PublicEndpoints"
  policy_type         = "Custom"
  display_name        = "Deny-Public-Endpoints-for-PaaS-Services"
  description         = "null"
  management_group_id = azurerm_management_group.es.name
  depends_on = [
    azurerm_policy_definition.deny_publicendpoint_aks,
    azurerm_policy_definition.deny_publicendpoint_cosmosdb,
    azurerm_policy_definition.deny_publicendpoint_keyvault,
    azurerm_policy_definition.deny_publicendpoint_mariadb,
    azurerm_policy_definition.deny_publicendpoint_mysql,
    azurerm_policy_definition.deny_publicendpoint_postgresql,
    azurerm_policy_definition.deny_publicendpoint_sql,
    azurerm_policy_definition.deny_publicendpoint_storage,
  ]
  policy_definitions = var.policysetdefinition_deny_publicendpoints_policydefinitions

}

variable "policysetdefinition_deny_publicendpoints_policydefinitions" {
  type = string
}

variable "policysetdefinition_deny_publicendpoints_parameters" {
  type    = string
  default = ""
}

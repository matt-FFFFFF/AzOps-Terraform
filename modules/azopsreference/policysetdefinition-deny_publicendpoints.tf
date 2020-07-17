# This file was auto generated
resource "azurerm_policy_set_definition" "deny_publicendpoints" {
  name                  = "Deny-PublicEndpoints"
  policy_type           = "Custom"
  display_name          = "Deny-Public-Endpoints-for-PaaS-Services"
  description           = "null"
  management_group_name = var.management_group_name
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
  policy_definitions = <<POLICYDEFINITIONS
[
  {
    "policyDefinitionReferenceId": "DenyPublicEndpointMariaDB",
    "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deny-PublicEndpoint-MariaDB",
    "parameters": {}
  },
  {
    "policyDefinitionReferenceId": "DenyPublicEndpointMySQL",
    "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deny-PublicEndpoint-MySQL",
    "parameters": {}
  },
  {
    "policyDefinitionReferenceId": "DenyPublicEndpointPostgreSql",
    "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deny-PublicEndpoint-PostgreSql",
    "parameters": {}
  },
  {
    "policyDefinitionReferenceId": "DenyPublicEndpointKeyVault",
    "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deny-PublicEndpoint-KeyVault",
    "parameters": {}
  },
  {
    "policyDefinitionReferenceId": "DenyPublicEndpointSql",
    "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deny-PublicEndpoint-Sql",
    "parameters": {}
  },
  {
    "policyDefinitionReferenceId": "DenyPublicEndpointStorage",
    "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deny-PublicEndpoint-Storage",
    "parameters": {}
  },
  {
    "policyDefinitionReferenceId": "DenyPublicEndpointAks",
    "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deny-PublicEndpoint-Aks",
    "parameters": {}
  }
]
POLICYDEFINITIONS

}

output "policysetdefinition_deny_publicendpoints" {
  value = azurerm_policy_set_definition.deny_publicendpoints
}


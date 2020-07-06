# This fine was auto generated
resource "azurerm_policy_set_definition" "deny_publicendpoints" {
  name                = "Deny-PublicEndpoints"
  policy_type         = "Custom"
  display_name        = "Deny-Public-Endpoints-for-PaaS-Services"
  description         = "null"
  management_group_id = var.management_group_name
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
    "policyDefinitionReferenceId": "Deny-PublicEndpoint-MariaDB",
    "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/ES-mawhi/providers/Microsoft.Authorization/policyDefinitions/Deny-PublicEndpoint-MariaDB",
    "parameters": {}
  },
  {
    "policyDefinitionReferenceId": "Deny-PublicEndpoint-MySQL",
    "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/ES-mawhi/providers/Microsoft.Authorization/policyDefinitions/Deny-PublicEndpoint-MySQL",
    "parameters": {}
  },
  {
    "policyDefinitionReferenceId": "Deny-PublicEndpoint-PostgreSql",
    "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/ES-mawhi/providers/Microsoft.Authorization/policyDefinitions/Deny-PublicEndpoint-PostgreSql",
    "parameters": {}
  },
  {
    "policyDefinitionReferenceId": "Deny-PublicEndpoint-KeyVault",
    "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/ES-mawhi/providers/Microsoft.Authorization/policyDefinitions/Deny-PublicEndpoint-KeyVault",
    "parameters": {}
  },
  {
    "policyDefinitionReferenceId": "Deny-PublicEndpoint-Sql",
    "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/ES-mawhi/providers/Microsoft.Authorization/policyDefinitions/Deny-PublicEndpoint-Sql",
    "parameters": {}
  },
  {
    "policyDefinitionReferenceId": "Deny-PublicEndpoint-Storage",
    "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/ES-mawhi/providers/Microsoft.Authorization/policyDefinitions/Deny-PublicEndpoint-Storage",
    "parameters": {}
  },
  {
    "policyDefinitionReferenceId": "Deny-PublicEndpoint-Aks",
    "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/ES-mawhi/providers/Microsoft.Authorization/policyDefinitions/Deny-PublicEndpoint-Aks",
    "parameters": {}
  }
]
POLICYDEFINITIONS

}

output "policysetdefinition_deny_publicendpoints" {
  value = azurerm_policy_set_definition.deny_publicendpoints
}


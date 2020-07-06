# This fine was auto generated
resource "azurerm_policy_set_definition" "deploy_sql_security" {
  name                = "Deploy-Sql-Security"
  policy_type         = "Custom"
  display_name        = "Deploy-Sql-Security"
  description         = "Recommended built-in security policies for the North Star architecture"
  management_group_id = var.management_group_name
  depends_on = [
    azurerm_policy_definition.deploy_sql_auditingsettings,
    azurerm_policy_definition.deploy_sql_securityalertpolicies,
    azurerm_policy_definition.deploy_sql_tde,
    azurerm_policy_definition.deploy_sql_vulnerabilityassessments,
  ]
  policy_definitions = <<POLICYDEFINITIONS
{
  "policyDefinitionReferenceId": "Deploy-Sql-Tde",
  "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/ES-mawhi/providers/Microsoft.Authorization/policyDefinitions/Deploy-Sql-Tde",
  "parameters": {}
}
{
  "policyDefinitionReferenceId": "Deploy-Sql-SecurityAlertPolicies",
  "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/ES-mawhi/providers/Microsoft.Authorization/policyDefinitions/Deploy-Sql-SecurityAlertPolicies",
  "parameters": {}
}
{
  "policyDefinitionReferenceId": "Deploy-Sql-AuditingSettings",
  "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/ES-mawhi/providers/Microsoft.Authorization/policyDefinitions/Deploy-Sql-AuditingSettings",
  "parameters": {}
}
{
  "policyDefinitionReferenceId": "Deploy-Sql-vulnerabilityAssessments",
  "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/ES-mawhi/providers/Microsoft.Authorization/policyDefinitions/Deploy-Sql-vulnerabilityAssessments",
  "parameters": {
    "vulnerabilityAssessmentsEmail": {
      "value": "[parameters('vulnerabilityAssessmentsEmail')]"
    },
    "vulnerabilityAssessmentsStorageID": {
      "value": "[parameters('vulnerabilityAssessmentsStorageID')]"
    }
  }
}
POLICYDEFINITIONS
  parameters         = <<PARAMETERS
{
  "vulnerabilityAssessmentsEmail": {
    "type": "String",
    "metadata": {
      "description": "The email address to send alerts",
      "displayName": "The email address to send alerts"
    }
  },
  "vulnerabilityAssessmentsStorageID": {
    "type": "String",
    "metadata": {
      "description": "The storage account to store assessments",
      "displayName": "The storage account to store assessments"
    }
  }
}
PARAMETERS
}

output "policysetdefinition_deploy_sql_security" {
  value = azurerm_policy_set_definition.deploy_sql_security
}


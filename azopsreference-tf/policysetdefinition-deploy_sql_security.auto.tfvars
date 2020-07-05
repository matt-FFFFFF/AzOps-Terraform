policysetdefinition_deploy_sql_security_policydefinitions = <<POLICYDEFINITIONS
[
  {
    "policyDefinitionReferenceId": "Deploy-Sql-Tde",
    "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/ES/providers/Microsoft.Authorization/policyDefinitions/Deploy-Sql-Tde",
    "parameters": {}
  },
  {
    "policyDefinitionReferenceId": "Deploy-Sql-SecurityAlertPolicies",
    "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/ES/providers/Microsoft.Authorization/policyDefinitions/Deploy-Sql-SecurityAlertPolicies",
    "parameters": {}
  },
  {
    "policyDefinitionReferenceId": "Deploy-Sql-AuditingSettings",
    "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/ES/providers/Microsoft.Authorization/policyDefinitions/Deploy-Sql-AuditingSettings",
    "parameters": {}
  },
  {
    "policyDefinitionReferenceId": "Deploy-Sql-vulnerabilityAssessments",
    "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/ES/providers/Microsoft.Authorization/policyDefinitions/Deploy-Sql-vulnerabilityAssessments",
    "parameters": {
      "vulnerabilityAssessmentsEmail": {
        "value": "[parameters('vulnerabilityAssessmentsEmail')]"
      },
      "vulnerabilityAssessmentsStorageID": {
        "value": "[parameters('vulnerabilityAssessmentsStorageID')]"
      }
    }
  }
]
POLICYDEFINITIONS

policysetdefinition_deploy_sql_security_parameters = <<PARAMETERS
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


policysetdefinition_deploy_sql_security_policydefinitions = <<POLICYDEFINITIONS
[
  {
    "policydefinitionreferenceid": "Deploy-Sql-Tde",
    "policydefinitionid": "/providers/Microsoft.Management/managementGroups/ES/providers/Microsoft.Authorization/policyDefinitions/Deploy-Sql-Tde",
    "parameters": {}
  },
  {
    "policydefinitionreferenceid": "Deploy-Sql-SecurityAlertPolicies",
    "policydefinitionid": "/providers/Microsoft.Management/managementGroups/ES/providers/Microsoft.Authorization/policyDefinitions/Deploy-Sql-SecurityAlertPolicies",
    "parameters": {}
  },
  {
    "policydefinitionreferenceid": "Deploy-Sql-AuditingSettings",
    "policydefinitionid": "/providers/Microsoft.Management/managementGroups/ES/providers/Microsoft.Authorization/policyDefinitions/Deploy-Sql-AuditingSettings",
    "parameters": {}
  },
  {
    "policydefinitionreferenceid": "Deploy-Sql-vulnerabilityAssessments",
    "policydefinitionid": "/providers/Microsoft.Management/managementGroups/ES/providers/Microsoft.Authorization/policyDefinitions/Deploy-Sql-vulnerabilityAssessments",
    "parameters": {
      "vulnerabilityassessmentsemail": {
        "value": "[parameters('vulnerabilityAssessmentsEmail')]"
      },
      "vulnerabilityassessmentsstorageid": {
        "value": "[parameters('vulnerabilityAssessmentsStorageID')]"
      }
    }
  }
]
POLICYDEFINITIONS

policysetdefinition_deploy_sql_security_parameters = <<PARAMETERS
{
  "vulnerabilityassessmentsemail": {
    "type": "String",
    "metadata": {
      "description": "The email address to send alerts",
      "displayname": "The email address to send alerts"
    }
  },
  "vulnerabilityassessmentsstorageid": {
    "type": "String",
    "metadata": {
      "description": "The storage account to store assessments",
      "displayname": "The storage account to store assessments"
    }
  }
}
PARAMETERS

policysetdefinition_deploy_sql_security_policydefinitions = <<POLICYDEFINITIONS
[
  {
    "policydefinitionreferenceid": "Deploy-Sql-Tde",
    "policydefinitionid": "/providers/Microsoft.Management/managementGroups/contoso/providers/Microsoft.Authorization/policyDefinitions/Deploy-Sql-Tde",
    "parameters": {}
  },
  {
    "policydefinitionreferenceid": "Deploy-Sql-SecurityAlertPolicies",
    "policydefinitionid": "/providers/Microsoft.Management/managementGroups/contoso/providers/Microsoft.Authorization/policyDefinitions/Deploy-Sql-SecurityAlertPolicies",
    "parameters": {}
  },
  {
    "policydefinitionreferenceid": "Deploy-Sql-AuditingSettings",
    "policydefinitionid": "/providers/Microsoft.Management/managementGroups/contoso/providers/Microsoft.Authorization/policyDefinitions/Deploy-Sql-AuditingSettings",
    "parameters": {}
  },
  {
    "policydefinitionreferenceid": "Deploy-Sql-vulnerabilityAssessments",
    "policydefinitionid": "/providers/Microsoft.Management/managementGroups/contoso/providers/Microsoft.Authorization/policyDefinitions/Deploy-Sql-vulnerabilityAssessments",
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


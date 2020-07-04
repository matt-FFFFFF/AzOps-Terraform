policydefinition_deploy_diagnostics_recoveryvault_policyrule = <<POLICYRULE
{
  "if": {
    "field": "type",
    "equals": "Microsoft.RecoveryServices/vaults"
  },
  "then": {
    "effect": "deployIfNotExists",
    "details": {
      "type": "Microsoft.Insights/diagnosticSettings",
      "name": "setByPolicy",
      "existencecondition": {
        "allof": [
          {
            "count": {
              "field": "Microsoft.Insights/diagnosticSettings/logs[*]",
              "where": {
                "allof": [
                  {
                    "field": "Microsoft.Insights/diagnosticSettings/logs[*].Category",
                    "in": [
                      "CoreAzureBackup",
                      "AddonAzureBackupJobs",
                      "AddonAzureBackupAlerts",
                      "AddonAzureBackupPolicy",
                      "AddonAzureBackupStorage",
                      "AddonAzureBackupProtectedInstance"
                    ]
                  },
                  {
                    "field": "Microsoft.Insights/diagnosticSettings/logs[*].Enabled",
                    "equals": "True"
                  }
                ]
              }
            },
            "equals": 6
          },
          {
            "field": "Microsoft.Insights/diagnosticSettings/workspaceId",
            "notequals": "[parameters('logAnalytics')]"
          },
          {
            "field": "Microsoft.Insights/diagnosticSettings/logAnalyticsDestinationType",
            "equals": "Dedicated"
          }
        ]
      },
      "roledefinitionids": [
        "/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c"
      ],
      "deployment": {
        "properties": {
          "mode": "incremental",
          "template": {
            "$schema": "http://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
            "contentversion": "1.0.0.0",
            "parameters": {
              "resourcename": {
                "type": "string"
              },
              "loganalytics": {
                "type": "string"
              },
              "location": {
                "type": "string"
              }
            },
            "variables": {},
            "resources": [
              {
                "type": "Microsoft.RecoveryServices/vaults/providers/diagnosticSettings",
                "apiversion": "2017-05-01-preview",
                "name": "[concat(parameters('resourceName'), '/', 'Microsoft.Insights/', 'setByPolicy')]",
                "dependson": [],
                "properties": {
                  "workspaceid": "[parameters('logAnalytics')]",
                  "loganalyticsdestinationtype": "Dedicated",
                  "metrics": [],
                  "logs": [
                    {
                      "category": "CoreAzureBackup",
                      "enabled": "true"
                    },
                    {
                      "category": "AddonAzureBackupAlerts",
                      "enabled": "true"
                    },
                    {
                      "category": "AddonAzureBackupJobs",
                      "enabled": "true"
                    },
                    {
                      "category": "AddonAzureBackupPolicy",
                      "enabled": "true"
                    },
                    {
                      "category": "AddonAzureBackupProtectedInstance",
                      "enabled": "true"
                    },
                    {
                      "category": "AddonAzureBackupStorage",
                      "enabled": "true"
                    }
                  ]
                }
              }
            ],
            "outputs": {}
          },
          "parameters": {
            "loganalytics": {
              "value": "[parameters('logAnalytics')]"
            },
            "location": {
              "value": "[field('location')]"
            },
            "resourcename": {
              "value": "[field('name')]"
            }
          }
        }
      }
    }
  }
}
POLICYRULE

policydefinition_deploy_diagnostics_recoveryvault_parameters = <<PARAMETERS
{
  "loganalytics": {
    "type": "String",
    "metadata": {
      "displayname": "Log Analytics workspace",
      "description": "Select the Log Analytics workspace from dropdown list",
      "strongtype": "omsWorkspace"
    }
  }
}
PARAMETERS


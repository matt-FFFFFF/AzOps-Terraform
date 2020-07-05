policydefinition_deploy_diagnostics_nic_policyrule = <<POLICYRULE
{
  "if": {
    "field": "type",
    "equals": "Microsoft.Network/networkInterfaces"
  },
  "then": {
    "effect": "deployIfNotExists",
    "details": {
      "type": "Microsoft.Insights/diagnosticSettings",
      "name": "setByPolicy",
      "existencecondition": {
        "allof": [
          {
            "field": "Microsoft.Insights/diagnosticSettings/metrics.enabled",
            "equals": "true"
          },
          {
            "field": "Microsoft.Insights/diagnosticSettings/workspaceId",
            "equals": "[parameters('logAnalytics')]"
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
                "type": "Microsoft.Network/networkInterfaces/providers/diagnosticSettings",
                "apiversion": "2017-05-01-preview",
                "name": "[concat(parameters('resourceName'), '/', 'Microsoft.Insights/setByPolicy')]",
                "location": "[parameters('location')]",
                "dependson": [],
                "properties": {
                  "workspaceid": "[parameters('logAnalytics')]",
                  "metrics": [
                    {
                      "category": "AllMetrics",
                      "enabled": true,
                      "retentionpolicy": {
                        "enabled": false,
                        "days": 0
                      }
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

policydefinition_deploy_diagnostics_nic_parameters = <<PARAMETERS
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


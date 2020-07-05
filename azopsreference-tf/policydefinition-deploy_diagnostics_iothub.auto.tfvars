policydefinition_deploy_diagnostics_iothub_policyrule = <<POLICYRULE
{
  "if": {
    "field": "type",
    "equals": "Microsoft.Devices/IotHubs"
  },
  "then": {
    "effect": "deployIfNotExists",
    "details": {
      "type": "Microsoft.Insights/diagnosticSettings",
      "name": "setByPolicy",
      "existencecondition": {
        "allof": [
          {
            "field": "Microsoft.Insights/diagnosticSettings/logs.enabled",
            "equals": "true"
          },
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
                "type": "Microsoft.Devices/IotHubs/providers/diagnosticSettings",
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
                        "days": 0,
                        "enabled": false
                      }
                    }
                  ],
                  "logs": [
                    {
                      "category": "Connections",
                      "enabled": true
                    },
                    {
                      "category": "DeviceTelemetry",
                      "enabled": true
                    },
                    {
                      "category": "C2DCommands",
                      "enabled": true
                    },
                    {
                      "category": "DeviceIdentityOperations",
                      "enabled": true
                    },
                    {
                      "category": "FileUploadOperations",
                      "enabled": true
                    },
                    {
                      "category": "Routes",
                      "enabled": true
                    },
                    {
                      "category": "D2CTwinOperations",
                      "enabled": true
                    },
                    {
                      "category": "C2DTwinOperations",
                      "enabled": true
                    },
                    {
                      "category": "TwinQueries",
                      "enabled": true
                    },
                    {
                      "category": "JobsOperations",
                      "enabled": true
                    },
                    {
                      "category": "DirectMethods",
                      "enabled": true
                    },
                    {
                      "category": "E2EDiagnostics",
                      "enabled": true
                    },
                    {
                      "category": "Configurations",
                      "enabled": true
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

policydefinition_deploy_diagnostics_iothub_parameters = <<PARAMETERS
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


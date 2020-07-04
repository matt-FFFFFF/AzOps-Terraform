policyDefinition-Deploy-Diagnostics-ActivityLog-policyrule = <<POLICYRULE
{
  "if": {
    "allof": [
      {
        "field": "type",
        "equals": "Microsoft.Resources/subscriptions"
      }
    ]
  },
  "then": {
    "effect": "deployIfNotExists",
    "details": {
      "type": "Microsoft.Insights/diagnosticSettings",
      "deploymentscope": "Subscription",
      "existencescope": "Subscription",
      "existencecondition": {
        "allof": [
          {
            "field": "Microsoft.Insights/diagnosticSettings/logs.enabled",
            "equals": "true"
          },
          {
            "field": "Microsoft.Insights/diagnosticSettings/workspaceId",
            "equals": "[parameters('logAnalytics')]"
          }
        ]
      },
      "deployment": {
        "location": "northeurope",
        "properties": {
          "mode": "incremental",
          "template": {
            "$schema": "https://schema.management.azure.com/schemas/2018-05-01/subscriptionDeploymentTemplate.json#",
            "contentversion": "1.0.0.0",
            "parameters": {
              "loganalytics": {
                "type": "string"
              }
            },
            "variables": {},
            "resources": [
              {
                "name": "subscriptionLogsToLogAnalytics",
                "type": "Microsoft.Insights/diagnosticSettings",
                "apiversion": "2017-05-01-preview",
                "location": "Global",
                "properties": {
                  "workspaceid": "[parameters('logAnalytics')]",
                  "logs": [
                    {
                      "category": "Administrative",
                      "enabled": true
                    },
                    {
                      "category": "Security",
                      "enabled": true
                    },
                    {
                      "category": "ServiceHealth",
                      "enabled": true
                    },
                    {
                      "category": "Alert",
                      "enabled": true
                    },
                    {
                      "category": "Recommendation",
                      "enabled": true
                    },
                    {
                      "category": "Policy",
                      "enabled": true
                    },
                    {
                      "category": "Autoscale",
                      "enabled": true
                    },
                    {
                      "category": "ResourceHealth",
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
            }
          }
        }
      },
      "roledefinitionids": [
        "/providers/Microsoft.Authorization/roleDefinitions/8e3af657-a8ff-443c-a75c-2fe8c4bcb635"
      ]
    }
  }
}
POLICYRULE

policyDefinition-Deploy-Diagnostics-ActivityLog-parameters = <<PARAMETERS
{
  "loganalytics": {
    "type": "String",
    "metadata": {
      "displayname": "Primary Log Analytics workspace",
      "description": "Select Log Analytics workspace from dropdown list",
      "strongtype": "omsWorkspace"
    }
  }
}
PARAMETERS


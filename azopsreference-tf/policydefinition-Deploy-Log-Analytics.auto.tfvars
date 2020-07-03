policyDefinition-Deploy-Log-Analytics-policyrule = <<POLICYRULE
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
      "type": "Microsoft.OperationalInsights/workspaces",
      "deploymentscope": "Subscription",
      "existencescope": "Subscription",
      "roledefinitionids": [
        "/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c"
      ],
      "existencecondition": {
        "allof": [
          {
            "field": "name",
            "like": "[parameters('workspaceName')]"
          }
        ]
      },
      "deployment": {
        "location": "westeurope",
        "properties": {
          "mode": "incremental",
          "parameters": {
            "rgname": {
              "value": "[parameters('rgName')]"
            },
            "workspacename": {
              "value": "[parameters('workspaceName')]"
            },
            "workspaceregion": {
              "value": "[parameters('workspaceRegion')]"
            },
            "automationaccountname": {
              "value": "[parameters('automationAccountName')]"
            },
            "automationregion": {
              "value": "[parameters('automationRegion')]"
            }
          },
          "template": {
            "$schema": "http://schema.management.azure.com/schemas/2018-05-01/subscriptionDeploymentTemplate.json",
            "contentversion": "1.0.0.0",
            "parameters": {
              "rgname": {
                "type": "string"
              },
              "workspacename": {
                "type": "string"
              },
              "workspaceregion": {
                "type": "string"
              },
              "automationaccountname": {
                "type": "string"
              },
              "automationregion": {
                "type": "string"
              }
            },
            "variables": {},
            "resources": [
              {
                "type": "Microsoft.Resources/resourceGroups",
                "apiversion": "2018-05-01",
                "name": "[parameters('rgName')]",
                "location": "[deployment().location]",
                "properties": {}
              },
              {
                "type": "Microsoft.Resources/deployments",
                "apiversion": "2018-05-01",
                "name": "log-analytics",
                "resourcegroup": "[parameters('rgName')]",
                "dependson": [
                  "[resourceId('Microsoft.Resources/resourceGroups/', parameters('rgName'))]"
                ],
                "properties": {
                  "mode": "Incremental",
                  "template": {
                    "$schema": "http://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json",
                    "contentversion": "1.0.0.0",
                    "parameters": {},
                    "variables": {},
                    "resources": [
                      {
                        "apiversion": "2015-10-31",
                        "location": "[parameters('AutomationRegion')]",
                        "name": "[parameters('AutomationAccountName')]",
                        "type": "Microsoft.Automation/automationAccounts",
                        "comments": "Automation account for ",
                        "properties": {
                          "sku": {
                            "name": "OMS"
                          }
                        }
                      },
                      {
                        "apiversion": "2017-03-15-preview",
                        "location": "[parameters('workspaceRegion')]",
                        "name": "[parameters('workspaceName')]",
                        "type": "Microsoft.OperationalInsights/workspaces",
                        "properties": {
                          "sku": {
                            "name": "pernode"
                          },
                          "enablelogaccessusingonlyresourcepermissions": true
                        },
                        "resources": [
                          {
                            "name": "Automation",
                            "type": "linkedServices",
                            "apiversion": "2015-11-01-preview",
                            "dependson": [
                              "[resourceId('Microsoft.OperationalInsights/workspaces/', parameters('workspaceName'))]",
                              "[resourceId('Microsoft.Automation/automationAccounts/', parameters('AutomationAccountName'))]"
                            ],
                            "properties": {
                              "resourceid": "[concat(subscription().id, '/resourceGroups/', parameters('rgName'), '/providers/Microsoft.Automation/automationAccounts/', parameters('AutomationAccountName'))]"
                            }
                          }
                        ]
                      }
                    ],
                    "outputs": {}
                  }
                }
              }
            ],
            "outputs": {}
          }
        }
      }
    }
  }
}
POLICYRULE

policyDefinition-Deploy-Log-Analytics-parameters = <<PARAMETERS
{
  "workspacename": {
    "type": "String",
    "metadata": {
      "displayname": "workspaceName",
      "description": "Provide name for log analytics workspace"
    }
  },
  "automationaccountname": {
    "type": "String",
    "metadata": {
      "displayname": "automationAccountName",
      "description": "Provide name for automation account"
    }
  },
  "workspaceregion": {
    "type": "String",
    "metadata": {
      "displayname": "workspaceRegion",
      "description": "Select Azure region for Log Analytics"
    }
  },
  "automationregion": {
    "type": "String",
    "metadata": {
      "displayname": "automationRegion",
      "description": "Select Azure region for Automation account"
    }
  },
  "rgname": {
    "type": "String",
    "metadata": {
      "displayname": "rgName",
      "description": "Provide name for resource group."
    }
  }
}
PARAMETERS


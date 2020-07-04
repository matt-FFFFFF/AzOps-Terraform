policyDefinition_deploy_ddosprotection_policyrule = <<POLICYRULE
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
      "type": "Microsoft.Resources/resourceGroups",
      "deploymentscope": "Subscription",
      "existencescope": "Subscription",
      "roledefinitionids": [
        "/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c"
      ],
      "existencecondition": {
        "allof": [
          {
            "field": "name",
            "like": "[parameters('rgName')]"
          },
          {
            "field": "type",
            "equals": "Microsoft.Resources/subscriptions/resourceGroups"
          },
          {
            "field": "type",
            "equals": "Microsoft.Network/ddosProtectionPlans"
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
            "ddosname": {
              "value": "[parameters('ddosname')]"
            },
            "ddosregion": {
              "value": "[parameters('ddosRegion')]"
            }
          },
          "template": {
            "$schema": "http://schema.management.azure.com/schemas/2018-05-01/subscriptionDeploymentTemplate.json",
            "contentversion": "1.0.0.0",
            "parameters": {
              "rgname": {
                "type": "string"
              },
              "ddosname": {
                "type": "string"
              },
              "ddosregion": {
                "type": "string"
              }
            },
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
                "name": "ddosprotection",
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
                    "resources": [
                      {
                        "type": "Microsoft.Network/ddosProtectionPlans",
                        "apiversion": "2019-12-01",
                        "name": "[parameters('ddosName')]",
                        "location": "[parameters('ddosRegion')]",
                        "properties": {}
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

policyDefinition_deploy_ddosprotection_parameters = <<PARAMETERS
{
  "ddosname": {
    "type": "String",
    "metadata": {
      "displayname": "ddosName",
      "description": "Name of the Virtual WAN"
    }
  },
  "ddosregion": {
    "type": "String",
    "metadata": {
      "displayname": "ddosRegion",
      "description": "Select Azure region for Virtual WAN",
      "strongtype": "location"
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


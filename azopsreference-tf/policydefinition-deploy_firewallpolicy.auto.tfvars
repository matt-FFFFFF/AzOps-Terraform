policydefinition_deploy_firewallpolicy_policyrule = <<POLICYRULE
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
      "type": "Microsoft.Network/firewallPolicies",
      "deploymentscope": "Subscription",
      "existencescope": "ResourceGroup",
      "resourcegroupname": "[parameters('rgName')]",
      "roledefinitionids": [
        "/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c"
      ],
      "deployment": {
        "location": "northeurope",
        "properties": {
          "mode": "incremental",
          "parameters": {
            "rgname": {
              "value": "[parameters('rgName')]"
            },
            "fwpolicy": {
              "value": "[parameters('fwPolicy')]"
            },
            "fwpolicyregion": {
              "value": "[parameters('fwPolicyRegion')]"
            }
          },
          "template": {
            "$schema": "http://schema.management.azure.com/schemas/2018-05-01/subscriptionDeploymentTemplate.json",
            "contentversion": "1.0.0.0",
            "parameters": {
              "rgname": {
                "type": "string"
              },
              "fwpolicy": {
                "type": "object"
              },
              "fwpolicyregion": {
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
                "name": "fwpolicies",
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
                        "type": "Microsoft.Network/firewallPolicies",
                        "apiversion": "2019-09-01",
                        "name": "[parameters('fwpolicy').firewallPolicyName]",
                        "location": "[parameters('fwpolicy').location]",
                        "dependson": [],
                        "tags": {},
                        "properties": {},
                        "resources": [
                          {
                            "type": "ruleGroups",
                            "apiversion": "2019-09-01",
                            "name": "[parameters('fwpolicy').ruleGroups.name]",
                            "dependson": [
                              "[resourceId('Microsoft.Network/firewallPolicies',parameters('fwpolicy').firewallPolicyName)]"
                            ],
                            "properties": {
                              "priority": "[parameters('fwpolicy').ruleGroups.properties.priority]",
                              "rules": "[parameters('fwpolicy').ruleGroups.properties.rules]"
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

policydefinition_deploy_firewallpolicy_parameters = <<PARAMETERS
{
  "fwpolicy": {
    "type": "Object",
    "metadata": {
      "displayname": "fwpolicy",
      "description": "Object describing Azure Firewall Policy"
    },
    "defaultvalue": {}
  },
  "fwpolicyregion": {
    "type": "String",
    "metadata": {
      "displayname": "fwPolicyRegion",
      "description": "Select Azure region for Azure Firewall Policy",
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


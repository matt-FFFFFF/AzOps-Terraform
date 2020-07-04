policydefinition_deploy_vwan_policyrule = <<POLICYRULE
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
      "type": "Microsoft.Network/virtualWans",
      "deploymentscope": "Subscription",
      "existencescope": "ResourceGroup",
      "name": "[parameters('vwanname')]",
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
            "vwanname": {
              "value": "[parameters('vwanname')]"
            },
            "vwanregion": {
              "value": "[parameters('vwanRegion')]"
            }
          },
          "template": {
            "$schema": "http://schema.management.azure.com/schemas/2018-05-01/subscriptionDeploymentTemplate.json",
            "contentversion": "1.0.0.0",
            "parameters": {
              "rgname": {
                "type": "string"
              },
              "vwanname": {
                "type": "string"
              },
              "vwanregion": {
                "type": "string"
              }
            },
            "variables": {
              "vwansku": "Standard"
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
                "name": "vwan",
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
                        "type": "Microsoft.Network/virtualWans",
                        "apiversion": "2019-09-01",
                        "location": "[parameters('vwanRegion')]",
                        "name": "[parameters('vwanname')]",
                        "properties": {
                          "virtualhubs": [],
                          "vpnsites": [],
                          "type": "[variables('vwansku')]"
                        }
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

policydefinition_deploy_vwan_parameters = <<PARAMETERS
{
  "vwanname": {
    "type": "String",
    "metadata": {
      "displayname": "vwanname",
      "description": "Name of the Virtual WAN"
    }
  },
  "vwanregion": {
    "type": "String",
    "metadata": {
      "displayname": "vwanRegion",
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


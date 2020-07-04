policyDefinition_deploy_nsg_flowlogs_policyrule = <<POLICYRULE
{
  "if": {
    "field": "type",
    "equals": "Microsoft.Network/networkSecurityGroups"
  },
  "then": {
    "effect": "deployIfNotExists",
    "details": {
      "type": "Microsoft.Network/networkWatchers/flowLogs",
      "roledefinitionids": [
        "/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c"
      ],
      "name": "[concat('NetworkWatcher_', field('location'), '/', 'Microsoft.Network', resourceGroup().name, field('name'))]",
      "resourcegroupname": "NetworkWatcherRG",
      "existencecondition": {
        "field": "Microsoft.Network/networkWatchers/flowLogs/enabled",
        "equals": "true"
      },
      "deployment": {
        "properties": {
          "mode": "incremental",
          "parameters": {
            "networksecuritygroupname": {
              "value": "[field('name')]"
            },
            "resourcegroupname": {
              "value": "[resourceGroup().name]"
            },
            "location": {
              "value": "[field('location')]"
            },
            "storageaccountresourceid": {
              "value": "[parameters('storageAccountResourceId')]"
            },
            "retention": {
              "value": "[parameters('retention')]"
            }
          },
          "template": {
            "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
            "contentversion": "1.0.0.0",
            "parameters": {
              "networksecuritygroupname": {
                "type": "string"
              },
              "resourcegroupname": {
                "type": "string"
              },
              "location": {
                "type": "string"
              },
              "storageaccountresourceid": {
                "type": "string"
              },
              "retention": {
                "type": "int",
                "defaultvalue": 5
              }
            },
            "variables": {},
            "resources": [
              {
                "type": "Microsoft.Network/networkWatchers/flowLogs",
                "apiversion": "2019-11-01",
                "name": "[concat('NetworkWatcher_', toLower(parameters('location')), '/', 'flowLogs')]",
                "location": "[parameters('location')]",
                "properties": {
                  "targetresourceid": "[resourceId(parameters('resourceGroupName'), 'Microsoft.Network/networkSecurityGroups', parameters('networkSecurityGroupName'))]",
                  "storageid": "[parameters('storageAccountResourceId')]",
                  "enabled": true,
                  "retentionpolicy": {
                    "enabled": true,
                    "days": "[parameters('retention')]"
                  },
                  "format": {
                    "type": "JSON",
                    "version": 2
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

policyDefinition_deploy_nsg_flowlogs_parameters = <<PARAMETERS
{
  "retention": {
    "type": "Integer",
    "metadata": {
      "displayname": "Retention"
    }
  },
  "storageaccountresourceid": {
    "type": "String",
    "metadata": {
      "displayname": "Storage Account Resource Id"
    }
  }
}
PARAMETERS


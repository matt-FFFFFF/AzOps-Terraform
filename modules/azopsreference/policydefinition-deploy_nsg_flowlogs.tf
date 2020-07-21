# This file was auto generated
resource "azurerm_policy_definition" "deploy_nsg_flowlogs" {
  name         = "Deploy-Nsg-FlowLogs"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Deploy-Nsg-FlowLogs"
  description  = "Deploys NSG flow logs and traffic analytics"

  management_group_name = var.management_group_name
  policy_rule           = <<POLICYRULE
{
  "if": {
    "field": "type",
    "equals": "Microsoft.Network/networkSecurityGroups"
  },
  "then": {
    "effect": "deployIfNotExists",
    "details": {
      "type": "Microsoft.Network/networkWatchers/flowLogs",
      "roleDefinitionIds": [
        "/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c"
      ],
      "resourceGroupName": "NetworkWatcherRG",
      "existenceCondition": {
        "allOf": [
          {
            "field": "Microsoft.Network/networkWatchers/flowLogs/enabled",
            "equals": "true"
          },
          {
            "field": "Microsoft.Network/networkWatchers/flowLogs/flowAnalyticsConfiguration.networkWatcherFlowAnalyticsConfiguration.enabled",
            "equals": "[parameters('flowAnalyticsEnabled')]"
          }
        ]
      },
      "deployment": {
        "properties": {
          "mode": "incremental",
          "parameters": {
            "networkSecurityGroupName": {
              "value": "[field('name')]"
            },
            "resourceGroupName": {
              "value": "[resourceGroup().name]"
            },
            "location": {
              "value": "[field('location')]"
            },
            "storageAccountResourceId": {
              "value": "[parameters('storageAccountResourceId')]"
            },
            "retention": {
              "value": "[parameters('retention')]"
            },
            "flowAnalyticsEnabled": {
              "value": "[parameters('flowAnalyticsEnabled')]"
            },
            "trafficAnalyticsInterval": {
              "value": "[parameters('trafficAnalyticsInterval')]"
            },
            "logAnalytics": {
              "value": "[parameters('logAnalytics')]"
            }
          },
          "template": {
            "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
            "contentVersion": "1.0.0.0",
            "parameters": {
              "networkSecurityGroupName": {
                "type": "string"
              },
              "resourceGroupName": {
                "type": "string"
              },
              "location": {
                "type": "string"
              },
              "storageAccountResourceId": {
                "type": "string"
              },
              "retention": {
                "type": "int"
              },
              "flowAnalyticsEnabled": {
                "type": "bool"
              },
              "trafficAnalyticsInterval": {
                "type": "int"
              },
              "logAnalytics": {
                "type": "string"
              }
            },
            "variables": {},
            "resources": [
              {
                "type": "Microsoft.Network/networkWatchers/flowLogs",
                "apiVersion": "2020-05-01",
                "name": "[concat('NetworkWatcher_', toLower(parameters('location')), '/', parameters('networkSecurityGroupName'), '-', parameters('resourceGroupName'), '-flowlog' )]",
                "location": "[parameters('location')]",
                "properties": {
                  "targetResourceId": "[resourceId(parameters('resourceGroupName'), 'Microsoft.Network/networkSecurityGroups', parameters('networkSecurityGroupName'))]",
                  "storageId": "[parameters('storageAccountResourceId')]",
                  "enabled": true,
                  "retentionPolicy": {
                    "enabled": true,
                    "days": "[parameters('retention')]"
                  },
                  "format": {
                    "type": "JSON",
                    "version": 2
                  },
                  "flowAnalyticsConfiguration": {
                    "networkWatcherFlowAnalyticsConfiguration": {
                      "enabled": "[bool(parameters('flowAnalyticsEnabled'))]",
                      "trafficAnalyticsInterval": "[parameters('trafficAnalyticsInterval')]",
                      "workspaceId": "[if(not(empty(parameters('logAnalytics'), reference(parameters('logAnalytics'), '2020-03-01-preview', 'Full').properties.customerId, json('null') )))]",
                      "workspaceRegion": "[if(not(empty(parameters('logAnalytics'), reference(parameters('logAnalytics'), '2020-03-01-preview', 'Full').location, json('null') )))]",
                      "workspaceResourceId": "[if(not(empty(parameters('logAnalytics'))), parameters('logAnalytics'), json('null'))]"
                    }
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

  parameters = <<PARAMETERS
{
  "retention": {
    "type": "Integer",
    "metadata": {
      "displayName": "Retention"
    },
    "defaultValue": 5
  },
  "storageAccountResourceId": {
    "type": "String",
    "metadata": {
      "displayName": "Storage Account Resource Id",
      "strongType": "Microsoft.Storage/storageAccounts"
    }
  },
  "trafficAnalyticsInterval": {
    "type": "Integer",
    "metadata": {
      "displayName": "Traffic Analytics processing interval mins (10/60)"
    },
    "defaultValue": 60
  },
  "flowAnalyticsEnabled": {
    "type": "Boolean",
    "metadata": {
      "displayName": "Enable Traffic Analytics"
    },
    "defaultValue": false
  },
  "logAnalytics": {
    "type": "string",
    "metadata": {
      "strongType": "omsWorkspace",
      "displayName": "Resource ID of Log Analytics workspace"
    },
    "defaultValue": ""
  }
}
PARAMETERS

}

output "policydefinition_deploy_nsg_flowlogs" {
  value = azurerm_policy_definition.deploy_nsg_flowlogs
}


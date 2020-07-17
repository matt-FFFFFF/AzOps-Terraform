# This file was auto generated
resource "azurerm_policy_definition" "deploy_nsg_flowlogs" {
  name         = "Deploy-Nsg-FlowLogs"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Deploy-Nsg-FlowLogs"
  description  = "null"

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
      "name": "[concat('NetworkWatcher_', field('location'), '/', 'Microsoft.Network', resourceGroup().name, field('name'))]",
      "resourceGroupName": "NetworkWatcherRG",
      "existenceCondition": {
        "field": "Microsoft.Network/networkWatchers/flowLogs/enabled",
        "equals": "true"
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
            "flowAnalyticsWorkspaceId": {
              "value": "[parameters('flowAnalyticsWorkspaceId')]"
            },
            "flowAnalyticsWorkspaceRegion": {
              "value": "[parameters('flowAnalyticsWorkspaceRegion')]"
            },
            "flowAnalyticsWorkspaceResourceId": {
              "value": "[parameters('flowAnalyticsWorkspaceResourceId')]"
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
                "type": "int",
                "defaultValue": 5
              },
              "flowAnalyticsEnabled": {
                "type": "string"
              },
              "flowAnalyticsWorkspaceId": {
                "type": "string"
              },
              "flowAnalyticsWorkspaceRegion": {
                "type": "string"
              },
              "flowAnalyticsWorkspaceResourceId": {
                "type": "string"
              }
            },
            "variables": {},
            "resources": [
              {
                "type": "Microsoft.Network/networkWatchers/flowLogs",
                "apiVersion": "2020-05-01",
                "name": "[concat('NetworkWatcher_', toLower(parameters('location')), '/', 'flowLogs')]",
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
                      "trafficAnalyticsInterval": 60,
                      "workspaceId": "[if(not(empty(parameters('flowAnalyticsWorkspaceId'))), parameters('flowAnalyticsWorkspaceId'), null)]",
                      "workspaceRegion": "[if(not(empty(parameters('flowAnalyticsWorkspaceRegion'))), parameters('flowAnalyticsWorkspaceRegion'), null)]",
                      "workspaceResourceId": "[if(not(empty(parameters('flowAnalyticsWorkspaceResourceId'))), parameters('flowAnalyticsWorkspaceResourceId'), null)]"
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
    }
  },
  "storageAccountResourceId": {
    "type": "String",
    "metadata": {
      "displayName": "Storage Account Resource Id"
    }
  },
  "flowAnalyticsEnabled": {
    "type": "string",
    "metadata": {
      "displayName": "Enable Flow Analytics (true/false)"
    },
    "defaultValue": "false"
  },
  "flowAnalyticsWorkspaceId": {
    "type": "string",
    "metadata": {
      "displayName": "Workspace GUID for Log Analytics"
    },
    "defaultValue": ""
  },
  "flowAnalyticsWorkspaceRegion": {
    "type": "string",
    "metadata": {
      "displayName": "Region for Log Analytics workspace"
    },
    "defaultValue": ""
  },
  "flowAnalyticsWorkspaceResourceId": {
    "type": "string",
    "metadata": {
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


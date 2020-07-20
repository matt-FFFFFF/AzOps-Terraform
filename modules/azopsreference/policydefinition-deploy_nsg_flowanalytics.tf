# This file was auto generated
resource "azurerm_policy_definition" "deploy_nsg_flowanalytics" {
  name         = "Deploy-Nsg-FlowAnalytics"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Deploy-Nsg-FlowAnalytics"
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
      "name": "[concat('NetworkWatcher_', field('location'), '/FlowLogs/', field('name'), '-', resourceGroup().name, '-flowlog' )]",
      "resourceGroupName": "NetworkWatcherRG",
      "existenceCondition": {
        "field": "Microsoft.Network/networkWatchers/flowLogs/flowAnalyticsConfiguration.networkWatcherFlowAnalyticsConfiguration.enabled",
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
            "trafficAnalyticsInterval": {
              "value": "[parameters('trafficAnalyticsInterval')]"
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
              "trafficAnalyticsInterval": {
                "type": "int",
                "defaultValue": 60
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
                "name": "[concat('NetworkWatcher_', toLower(parameters('location')), '/FlowLogs/', parameters('networkSecurityGroupName'), '-', parameters('resourceGroupName'), '-flowlog')]",
                "location": "[parameters('location')]",
                "properties": {
                  "flowAnalyticsConfiguration": {
                    "networkWatcherFlowAnalyticsConfiguration": {
                      "enabled": true,
                      "trafficAnalyticsInterval": "[paramaters('trafficAnalyticsInterval')]",
                      "workspaceId": "[if(not(empty(parameters('flowAnalyticsWorkspaceId'))), parameters('flowAnalyticsWorkspaceId'), '')]",
                      "workspaceRegion": "[if(not(empty(parameters('flowAnalyticsWorkspaceRegion'))), parameters('flowAnalyticsWorkspaceRegion'), '')]",
                      "workspaceResourceId": "[if(not(empty(parameters('flowAnalyticsWorkspaceResourceId'))), parameters('flowAnalyticsWorkspaceResourceId'), '')]"
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
  "trafficAnalyticsInterval": {
    "type": "Integer",
    "metadata": {
      "displayName": "Traffic Analytics processing interval mins (10/60)"
    }
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

output "policydefinition_deploy_nsg_flowanalytics" {
  value = azurerm_policy_definition.deploy_nsg_flowanalytics
}


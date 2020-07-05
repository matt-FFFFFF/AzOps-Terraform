policydefinition_deploy_vnet_policyrule = <<POLICYRULE
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
        "/providers/Microsoft.Authorization/roleDefinitions/8e3af657-a8ff-443c-a75c-2fe8c4bcb635"
      ],
      "existencecondition": {
        "allof": [
          {
            "field": "type",
            "equals": "Microsoft.Resources/subscriptions/resourceGroups"
          },
          {
            "field": "name",
            "like": "[concat(subscription().displayName, '-network')]"
          }
        ]
      },
      "deployment": {
        "location": "northeurope",
        "properties": {
          "mode": "incremental",
          "parameters": {
            "ipam": {
              "value": "[parameters('ipam')]",
              "defaultvalue": []
            }
          },
          "template": {
            "$schema": "http://schema.management.azure.com/schemas/2018-05-01/subscriptionDeploymentTemplate.json",
            "contentversion": "1.0.0.0",
            "parameters": {
              "ipam": {
                "type": "array",
                "defaultvalue": [
                  {
                    "name": "bu1-weu-msx3-vNet1",
                    "location": "westeurope",
                    "virtualnetworks": {
                      "properties": {
                        "addressspace": {
                          "addressprefixes": [
                            "10.51.217.0/24"
                          ]
                        }
                      }
                    },
                    "networksecuritygroups": {
                      "properties": {
                        "securityrules": []
                      }
                    },
                    "routetables": {
                      "properties": {
                        "routes": []
                      }
                    },
                    "hubvirtualnetworkconnection": {
                      "vwanvhubresourceid": "/subscriptions/99c2838f-a548-4884-a6e2-38c1f8fb4c0b/resourceGroups/contoso-global-vwan/providers/Microsoft.Network/virtualHubs/contoso-vhub-weu",
                      "properties": {
                        "allowhubtoremotevnettransit": true,
                        "allowremotevnettousehubvnetgateways": false,
                        "enableinternetsecurity": true
                      }
                    }
                  }
                ]
              }
            },
            "variables": {
              "vnetrgname": "[concat(subscription().displayName, '-network')]",
              "vnetname": "[concat(subscription().displayName, '-vNet')]",
              "vnetsubid": "[subscription().subscriptionId]"
            },
            "resources": [
              {
                "condition": "[if(and(not(empty(parameters('ipam'))), equals(toLower(parameters('ipam')[copyIndex()].name),toLower(variables('vNetName')))),bool('true'),bool('false'))]",
                "type": "Microsoft.Resources/deployments",
                "location": "[parameters('ipam')[copyIndex()].location]",
                "apiversion": "2018-05-01",
                "name": "[concat('Northstar-ipam-',subscription().displayName,'-RG-',copyIndex())]",
                "copy": {
                  "name": "ipam-rg-loop",
                  "count": "[length(parameters('ipam'))]"
                },
                "dependson": [],
                "properties": {
                  "mode": "Incremental",
                  "template": {
                    "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
                    "contentversion": "1.0.0.0",
                    "parameters": {},
                    "variables": {},
                    "resources": [
                      {
                        "type": "Microsoft.Resources/resourceGroups",
                        "apiversion": "2018-05-01",
                        "name": "[variables('vNetRgName')]",
                        "location": "[parameters('ipam')[copyIndex()].location]",
                        "properties": {}
                      },
                      {
                        "type": "Microsoft.Resources/resourceGroups",
                        "apiversion": "2018-05-01",
                        "name": "NetworkWatcherRG",
                        "location": "[parameters('ipam')[copyIndex()].location]",
                        "properties": {}
                      }
                    ],
                    "outputs": {}
                  }
                }
              },
              {
                "condition": "[if(and(not(empty(parameters('ipam'))), equals(toLower(parameters('ipam')[copyIndex()].name),toLower(variables('vNetName')))),bool('true'),bool('false'))]",
                "type": "Microsoft.Resources/deployments",
                "apiversion": "2018-05-01",
                "name": "[concat('Northstar-ipam-',subscription().displayName,'-nsg-udr-vnet-vwan-peering-',copyIndex())]",
                "copy": {
                  "name": "ipam-loop",
                  "count": "[length(parameters('ipam'))]"
                },
                "dependson": [
                  "[concat('Northstar-ipam-',subscription().displayName,'-RG-',copyIndex())]"
                ],
                "resourcegroup": "[variables('vNetRgName')]",
                "properties": {
                  "mode": "Incremental",
                  "template": {
                    "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
                    "contentversion": "1.0.0.0",
                    "parameters": {},
                    "variables": {},
                    "resources": [
                      {
                        "condition": "[contains(parameters('ipam')[copyIndex()],'networkSecurityGroups')]",
                        "apiversion": "2019-11-01",
                        "type": "Microsoft.Network/networkSecurityGroups",
                        "name": "[concat(subscription().displayName, '-nsg')]",
                        "location": "[parameters('ipam')[copyIndex()].location]",
                        "properties": "[if(contains(parameters('ipam')[copyIndex()],'networkSecurityGroups'),parameters('ipam')[copyIndex()].networkSecurityGroups.properties,json('null'))]"
                      },
                      {
                        "condition": "[contains(parameters('ipam')[copyIndex()],'routeTables')]",
                        "apiversion": "2019-11-01",
                        "type": "Microsoft.Network/routeTables",
                        "name": "[concat(subscription().displayName, '-udr')]",
                        "location": "[parameters('ipam')[copyIndex()].location]",
                        "properties": "[if(contains(parameters('ipam')[copyIndex()],'routeTables'),parameters('ipam')[copyIndex()].routeTables.properties,json('null'))]"
                      },
                      {
                        "condition": "[contains(parameters('ipam')[copyIndex()],'virtualNetworks')]",
                        "type": "Microsoft.Network/virtualNetworks",
                        "apiversion": "2020-04-01",
                        "name": "[concat(subscription().displayName, '-vnet')]",
                        "location": "[parameters('ipam')[copyIndex()].location]",
                        "dependson": [
                          "[concat(subscription().displayName, '-nsg')]",
                          "[concat(subscription().displayName, '-udr')]"
                        ],
                        "properties": "[if(contains(parameters('ipam')[copyIndex()],'virtualNetworks'),parameters('ipam')[copyIndex()].virtualNetworks.properties,json('null'))]"
                      },
                      {
                        "condition": "[and(contains(parameters('ipam')[copyIndex()],'virtualNetworks'),contains(parameters('ipam')[copyIndex()],'hubVirtualNetworkConnection'),contains(parameters('ipam')[copyIndex()].hubVirtualNetworkConnection,'vWanVhubResourceId'))]",
                        "type": "Microsoft.Resources/deployments",
                        "apiversion": "2018-05-01",
                        "name": "[concat('Northstar-ipam-vWan-',subscription().displayName,'-peering-',copyIndex())]",
                        "subscriptionid": "[if(and(contains(parameters('ipam')[copyIndex()],'hubVirtualNetworkConnection'),contains(parameters('ipam')[copyIndex()].hubVirtualNetworkConnection,'vWanVhubResourceId')),split(parameters('ipam')[copyIndex()].hubVirtualNetworkConnection.vWanVhubResourceId,'/')[2],json('null'))]",
                        "resourcegroup": "[if(and(contains(parameters('ipam')[copyIndex()],'hubVirtualNetworkConnection'),contains(parameters('ipam')[copyIndex()].hubVirtualNetworkConnection,'vWanVhubResourceId')),split(parameters('ipam')[copyIndex()].hubVirtualNetworkConnection.vWanVhubResourceId,'/')[4],json('null'))]",
                        "dependson": [
                          "[concat(subscription().displayName, '-vnet')]"
                        ],
                        "properties": {
                          "mode": "Incremental",
                          "expressionevaluationoptions": {
                            "scope": "inner"
                          },
                          "template": {
                            "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
                            "contentversion": "1.0.0.0",
                            "parameters": {
                              "remotevirtualnetwork": {
                                "type": "string"
                              },
                              "vwanvhubname": {
                                "type": "string",
                                "defaultvalue": ""
                              },
                              "allowhubtoremotevnettransit": {
                                "type": "bool",
                                "defaultvalue": true
                              },
                              "allowremotevnettousehubvnetgateways": {
                                "type": "bool",
                                "defaultvalue": false
                              },
                              "enableinternetsecurity": {
                                "type": "bool",
                                "defaultvalue": true
                              }
                            },
                            "variables": {},
                            "resources": [
                              {
                                "type": "Microsoft.Network/virtualHubs/hubVirtualNetworkConnections",
                                "apiversion": "2019-09-01",
                                "name": "[[concat(parameters('vWanVhubName'),'/',last(split(parameters('remoteVirtualNetwork'),'/')))]",
                                "properties": {
                                  "remotevirtualnetwork": {
                                    "id": "[[parameters('remoteVirtualNetwork')]"
                                  },
                                  "allowhubtoremotevnettransit": "[[parameters('allowHubToRemoteVnetTransit')]",
                                  "allowremotevnettousehubvnetgateways": "[[parameters('allowRemoteVnetToUseHubVnetGateways')]",
                                  "enableinternetsecurity": "[[parameters('enableInternetSecurity')]"
                                }
                              }
                            ],
                            "outputs": {}
                          },
                          "parameters": {
                            "remotevirtualnetwork": {
                              "value": "[concat(subscription().id,'/resourceGroups/',variables('vNetRgName'), '/providers/','Microsoft.Network/virtualNetworks/', concat(subscription().displayName, '-vnet'))]"
                            },
                            "vwanvhubname": {
                              "value": "[if(and(contains(parameters('ipam')[copyIndex()],'hubVirtualNetworkConnection'),contains(parameters('ipam')[copyIndex()].hubVirtualNetworkConnection,'vWanVhubResourceId')),split(parameters('ipam')[copyIndex()].hubVirtualNetworkConnection.vWanVhubResourceId,'/')[8],json('null'))]"
                            },
                            "allowhubtoremotevnettransit": {
                              "value": "[if(and(contains(parameters('ipam')[copyIndex()],'hubVirtualNetworkConnection'),contains(parameters('ipam')[copyIndex()].hubVirtualNetworkConnection,'vWanVhubResourceId')),parameters('ipam')[copyIndex()].hubVirtualNetworkConnection.properties.allowHubToRemoteVnetTransit,json('null'))]"
                            },
                            "allowremotevnettousehubvnetgateways": {
                              "value": "[if(and(contains(parameters('ipam')[copyIndex()],'hubVirtualNetworkConnection'),contains(parameters('ipam')[copyIndex()].hubVirtualNetworkConnection,'vWanVhubResourceId')),parameters('ipam')[copyIndex()].hubVirtualNetworkConnection.properties.allowRemoteVnetToUseHubVnetGateways,json('null'))]"
                            },
                            "enableinternetsecurity": {
                              "value": "[if(and(contains(parameters('ipam')[copyIndex()],'hubVirtualNetworkConnection'),contains(parameters('ipam')[copyIndex()].hubVirtualNetworkConnection,'vWanVhubResourceId')),parameters('ipam')[copyIndex()].hubVirtualNetworkConnection.properties.enableInternetSecurity,json('null'))]"
                            }
                          }
                        }
                      }
                    ],
                    "outputs": {}
                  }
                }
              }
            ],
            "outputs": {
              "ipam": {
                "condition": "[bool('true')]",
                "type": "int",
                "value": "[length(parameters('ipam'))]"
              }
            }
          }
        }
      }
    }
  }
}
POLICYRULE

policydefinition_deploy_vnet_parameters = <<PARAMETERS
{
  "ipam": {
    "type": "Array",
    "metadata": {
      "displayname": "ipam"
    },
    "defaultvalue": []
  }
}
PARAMETERS


policydefinition_deploy_vhub_policyrule = <<POLICYRULE
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
      "type": "Microsoft.Network/virtualHubs",
      "name": "[parameters('vHubName')]",
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
            "vwanname": {
              "value": "[parameters('vwanname')]"
            },
            "vhub": {
              "value": "[parameters('vHUB')]"
            },
            "vpngw": {
              "value": "[parameters('vpngw')]"
            },
            "ergw": {
              "value": "[parameters('ergw')]"
            },
            "azfw": {
              "value": "[parameters('azfw')]"
            },
            "vhubname": {
              "value": "[parameters('vHUBName')]"
            }
          },
          "template": {
            "$schema": "http://schema.management.azure.com/schemas/2018-05-01/subscriptionDeploymentTemplate.json",
            "contentversion": "1.0.0.0",
            "parameters": {
              "vwanname": {
                "type": "string",
                "metadata": {
                  "description": "Name of the Virtual WAN"
                }
              },
              "vhub": {
                "type": "object",
                "metadata": {
                  "description": "Object describing Virtual WAN vHUB"
                }
              },
              "vpngw": {
                "type": "object",
                "defaultvalue": {},
                "metadata": {
                  "description": "Object describing VPN gateway"
                }
              },
              "ergw": {
                "type": "object",
                "defaultvalue": {},
                "metadata": {
                  "description": "Object describing ExpressRoute gateway"
                }
              },
              "azfw": {
                "type": "object",
                "defaultvalue": {},
                "metadata": {
                  "description": "Object describing the Azure Firewall in vHUB"
                }
              },
              "rgname": {
                "type": "String",
                "metadata": {
                  "displayname": "rgName",
                  "description": "Provide name for resource group."
                }
              },
              "vhubname": {
                "type": "String",
                "metadata": {
                  "displayname": "vHUBName",
                  "description": "Name of the vHUB"
                }
              }
            },
            "variables": {
              "vwanresourceid": "[concat(subscription().id,'/resourceGroups/',parameters('rgName'),'/providers/Microsoft.Network/virtualWans/',parameters('vwanname'))]",
              "vwanhub": "[concat(subscription().id,'/resourceGroups/',parameters('rgName'),'/providers/Microsoft.Network/virtualHubs/',parameters('vHUBName'))]"
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
                "name": "[concat('vHUBdeploy-',parameters('vHUB').location)]",
                "resourcegroup": "[parameters('rgName')]",
                "dependson": [
                  "[resourceId('Microsoft.Resources/resourceGroups/', parameters('rgName'))]"
                ],
                "properties": {
                  "mode": "Incremental",
                  "template": {
                    "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
                    "contentversion": "1.0.0.0",
                    "parameters": {},
                    "variables": {},
                    "resources": [
                      {
                        "type": "Microsoft.Network/virtualHubs",
                        "apiversion": "2020-05-01",
                        "location": "[parameters('vHUB').location]",
                        "name": "[parameters('vHUBname')]",
                        "properties": {
                          "virtualwan": {
                            "id": "[variables('vwanresourceid')]"
                          },
                          "addressprefix": "[parameters('vHUB').addressPrefix]",
                          "vpngateway": "[if(not(empty(parameters('vHUB').vpnGateway)),parameters('vHUB').vpnGateway, json('null'))]"
                        }
                      }
                    ]
                  }
                }
              },
              {
                "type": "Microsoft.Resources/deployments",
                "apiversion": "2018-05-01",
                "condition": "[greater(length(parameters('vpngw')),0)]",
                "resourcegroup": "[parameters('rgName')]",
                "dependson": [
                  "[concat('vHUBdeploy-',parameters('vHUB').location)]"
                ],
                "name": "[concat(parameters('vHUBName'),'-vpngw')]",
                "properties": {
                  "mode": "Incremental",
                  "template": {
                    "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
                    "contentversion": "1.0.0.0",
                    "parameters": {},
                    "variables": {},
                    "resources": [
                      {
                        "type": "Microsoft.Network/vpnGateways",
                        "apiversion": "2019-09-01",
                        "location": "[parameters('vHUB').location]",
                        "name": "[parameters('vpngw').name]",
                        "properties": {
                          "virtualhub": {
                            "id": "[variables('vwanhub')]"
                          },
                          "bgpsettings": "[parameters('vpngw').bgpSettings]",
                          "vpngatewayscaleunit": "[parameters('vpngw').vpnGatewayScaleUnit]"
                        }
                      }
                    ]
                  }
                }
              },
              {
                "type": "Microsoft.Resources/deployments",
                "apiversion": "2018-05-01",
                "condition": "[greater(length(parameters('ergw')),0)]",
                "resourcegroup": "[parameters('rgName')]",
                "dependson": [
                  "[concat('vHUBdeploy-',parameters('vHUB').location)]"
                ],
                "name": "[concat(parameters('vHUBName'),'-ergw')]",
                "properties": {
                  "mode": "Incremental",
                  "template": {
                    "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
                    "contentversion": "1.0.0.0",
                    "parameters": {},
                    "variables": {},
                    "resources": [
                      {
                        "type": "Microsoft.Network/expressRouteGateways",
                        "apiversion": "2019-09-01",
                        "location": "[parameters('vHUB').location]",
                        "name": "[parameters('ergw').name]",
                        "properties": {
                          "virtualhub": {
                            "id": "[variables('vwanhub')]"
                          },
                          "autoscaleconfiguration": "[parameters('ergw').autoScaleConfiguration]",
                          "expressrouteconnections": "[parameters('ergw').expressRouteConnections]"
                        }
                      }
                    ]
                  }
                }
              },
              {
                "type": "Microsoft.Resources/deployments",
                "apiversion": "2018-05-01",
                "condition": "[greater(length(parameters('azfw')),0)]",
                "resourcegroup": "[parameters('rgName')]",
                "dependson": [
                  "[concat('vHUBdeploy-',parameters('vHUB').location)]"
                ],
                "name": "[concat(parameters('vHUBName'),'-azfw')]",
                "properties": {
                  "mode": "Incremental",
                  "template": {
                    "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
                    "contentversion": "1.0.0.0",
                    "parameters": {},
                    "resources": [
                      {
                        "apiversion": "2019-09-01",
                        "type": "Microsoft.Network/azureFirewalls",
                        "name": "[parameters('azfw').name]",
                        "location": "[parameters('vHUB').location]",
                        "properties": {
                          "virtualhub": {
                            "id": "[variables('vwanhub')]"
                          },
                          "sku": {
                            "name": "AZFW_Hub",
                            "tier": "Standard"
                          },
                          "firewallpolicy": {
                            "id": "[if(not(empty(parameters('azfw').firewallPolicy.id)),parameters('azfw').firewallPolicy.id, json('null'))]"
                          }
                        }
                      }
                    ]
                  }
                }
              }
            ]
          }
        }
      }
    }
  }
}
POLICYRULE

policydefinition_deploy_vhub_parameters = <<PARAMETERS
{
  "vwanname": {
    "type": "String",
    "metadata": {
      "displayname": "vwanname",
      "description": "Name of the Virtual WAN"
    }
  },
  "vhubname": {
    "type": "String",
    "metadata": {
      "displayname": "vHubName",
      "description": "Name of the vHUB"
    },
    "defaultvalue": ""
  },
  "vhub": {
    "type": "Object",
    "metadata": {
      "displayname": "vHUB",
      "description": "Object describing Virtual WAN vHUB"
    }
  },
  "vpngw": {
    "type": "Object",
    "metadata": {
      "displayname": "vpngw",
      "description": "Object describing VPN gateway"
    },
    "defaultvalue": {}
  },
  "ergw": {
    "type": "Object",
    "metadata": {
      "displayname": "ergw",
      "description": "Object describing ExpressRoute gateway"
    },
    "defaultvalue": {}
  },
  "azfw": {
    "type": "Object",
    "metadata": {
      "displayname": "azfw",
      "description": "Object describing the Azure Firewall in vHUB"
    },
    "defaultvalue": {}
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


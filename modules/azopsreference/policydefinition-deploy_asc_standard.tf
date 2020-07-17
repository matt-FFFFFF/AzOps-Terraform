# This fine was auto generated
resource "azurerm_policy_definition" "deploy_asc_standard" {
  name         = "Deploy-ASC-Standard"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Deploy-ASC-Standard"
  description  = "Ensures that subscriptions have Security Centre Standard enabled."

  management_group_name = var.management_group_name
  policy_rule           = <<POLICYRULE
{
  "if": {
    "allOf": [
      {
        "field": "type",
        "equals": "Microsoft.Resources/subscriptions"
      }
    ]
  },
  "then": {
    "effect": "deployIfNotExists",
    "details": {
      "type": "Microsoft.Security/pricings",
      "deploymentScope": "subscription",
      "existenceScope": "subscription",
      "roleDefinitionIds": [
        "/providers/Microsoft.Authorization/roleDefinitions/8e3af657-a8ff-443c-a75c-2fe8c4bcb635"
      ],
      "existenceCondition": {
        "allOf": [
          {
            "field": "Microsoft.Security/pricings/pricingTier",
            "equals": "Standard"
          },
          {
            "field": "type",
            "equals": "Microsoft.Security/pricings"
          }
        ]
      },
      "deployment": {
        "location": "northeurope",
        "properties": {
          "mode": "incremental",
          "parameters": {
            "emailSecurityContact": {
              "value": "[parameters('emailSecurityContact')]"
            },
            "phoneSecurityContact": {
              "value": "[parameters('phoneSecurityContact')]"
            },
            "pricingTierVMs": {
              "value": "[parameters('pricingTierVMs')]"
            },
            "pricingTierSqlServers": {
              "value": "[parameters('pricingTierSqlServers')]"
            },
            "pricingTierAppServices": {
              "value": "[parameters('pricingTierAppServices')]"
            },
            "pricingTierStorageAccounts": {
              "value": "[parameters('pricingTierStorageAccounts')]"
            },
            "pricingTierContainerRegistry": {
              "value": "[parameters('pricingTierContainerRegistry')]"
            },
            "pricingTierKeyVaults": {
              "value": "[parameters('pricingTierKeyVaults')]"
            },
            "pricingTierKubernetesService": {
              "value": "[parameters('pricingTierKubernetesService')]"
            },
            "pricingSqlServerVirtualMachines": {
              "value": "[parameters('pricingSqlServerVirtualMachines')]"
            }
          },
          "template": {
            "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
            "contentVersion": "1.0.0.0",
            "parameters": {
              "emailSecurityContact": {
                "type": "string",
                "metadata": {
                  "description": "email address of the contact, in the form of john@doe.com"
                }
              },
              "phoneSecurityContact": {
                "type": "string",
                "metadata": {
                  "description": "phone number of the Security Contact"
                }
              },
              "pricingTierVMs": {
                "type": "string",
                "metadata": {
                  "description": "pricingTierVMs"
                }
              },
              "pricingTierSqlServers": {
                "type": "string",
                "metadata": {
                  "description": "pricingTierSqlServers"
                }
              },
              "pricingTierAppServices": {
                "type": "string",
                "metadata": {
                  "description": "pricingTierAppServices"
                }
              },
              "pricingTierStorageAccounts": {
                "type": "string",
                "metadata": {
                  "description": "pricingTierStorageAccounts"
                }
              },
              "pricingTierContainerRegistry": {
                "type": "string",
                "metadata": {
                  "description": "pricingTierContainerRegistry"
                }
              },
              "pricingTierKeyVaults": {
                "type": "string",
                "metadata": {
                  "description": "pricingTierKeyVaults"
                }
              },
              "pricingTierKubernetesService": {
                "type": "string",
                "metadata": {
                  "description": "pricingTierKubernetesService"
                }
              },
              "pricingSqlServerVirtualMachines": {
                "type": "string",
                "metadata": {
                  "description": "pricingSqlServerVirtualMachines"
                }
              }
            },
            "variables": {},
            "resources": [
              {
                "type": "Microsoft.Security/securityContacts",
                "name": "default1",
                "apiVersion": "2017-08-01-preview",
                "properties": {
                  "email": "[parameters('emailSecurityContact')]",
                  "phone": "[parameters('phoneSecurityContact')]",
                  "alertNotifications": "On",
                  "alertsToAdmins": "On"
                }
              },
              {
                "type": "Microsoft.Security/pricings",
                "apiVersion": "2018-06-01",
                "name": "VirtualMachines",
                "properties": {
                  "pricingTier": "[parameters('pricingTierVMs')]"
                }
              },
              {
                "type": "Microsoft.Security/pricings",
                "apiVersion": "2018-06-01",
                "name": "StorageAccounts",
                "dependsOn": [
                  "[concat('Microsoft.Security/pricings/VirtualMachines')]"
                ],
                "properties": {
                  "pricingTier": "[parameters('pricingTierStorageAccounts')]"
                }
              },
              {
                "type": "Microsoft.Security/pricings",
                "apiVersion": "2018-06-01",
                "name": "AppServices",
                "dependsOn": [
                  "[concat('Microsoft.Security/pricings/StorageAccounts')]"
                ],
                "properties": {
                  "pricingTier": "[parameters('pricingTierAppServices')]"
                }
              },
              {
                "type": "Microsoft.Security/pricings",
                "apiVersion": "2018-06-01",
                "name": "SqlServers",
                "dependsOn": [
                  "[concat('Microsoft.Security/pricings/AppServices')]"
                ],
                "properties": {
                  "pricingTier": "[parameters('pricingTierSqlServers')]"
                }
              },
              {
                "type": "Microsoft.Security/pricings",
                "apiVersion": "2018-06-01",
                "name": "KeyVaults",
                "dependsOn": [
                  "[concat('Microsoft.Security/pricings/SqlServers')]"
                ],
                "properties": {
                  "pricingTier": "[parameters('pricingTierKeyVaults')]"
                }
              },
              {
                "type": "Microsoft.Security/pricings",
                "apiVersion": "2018-06-01",
                "name": "KubernetesService",
                "dependsOn": [
                  "[concat('Microsoft.Security/pricings/KeyVaults')]"
                ],
                "properties": {
                  "pricingTier": "[parameters('pricingTierKubernetesService')]"
                }
              },
              {
                "type": "Microsoft.Security/pricings",
                "apiVersion": "2018-06-01",
                "name": "ContainerRegistry",
                "dependsOn": [
                  "[concat('Microsoft.Security/pricings/KubernetesService')]"
                ],
                "properties": {
                  "pricingTier": "[parameters('pricingTierContainerRegistry')]"
                }
              },
              {
                "type": "Microsoft.Security/pricings",
                "apiVersion": "2018-06-01",
                "name": "SqlServerVirtualMachines",
                "dependsOn": [
                  "[concat('Microsoft.Security/pricings/ContainerRegistry')]"
                ],
                "properties": {
                  "pricingTier": "[parameters('pricingSqlServerVirtualMachines')]"
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
  "emailSecurityContact": {
    "type": "String",
    "metadata": {
      "displayName": "emailSecurityContact",
      "description": "email address of the contact, in the form of john@doe.com"
    }
  },
  "phoneSecurityContact": {
    "type": "String",
    "metadata": {
      "displayName": "phoneSecurityContact",
      "description": "phone number of the Security Contact"
    }
  },
  "pricingTierVMs": {
    "type": "String",
    "metadata": {
      "displayName": "pricingTierVMs"
    },
    "allowedValues": [
      "Standard",
      "Free"
    ],
    "defaultValue": "Standard"
  },
  "pricingTierSqlServers": {
    "type": "String",
    "metadata": {
      "displayName": "pricingTierSqlServers"
    },
    "allowedValues": [
      "Standard",
      "Free"
    ],
    "defaultValue": "Standard"
  },
  "pricingTierAppServices": {
    "type": "String",
    "metadata": {
      "displayName": "pricingTierAppServices"
    },
    "allowedValues": [
      "Standard",
      "Free"
    ],
    "defaultValue": "Standard"
  },
  "pricingTierStorageAccounts": {
    "type": "String",
    "metadata": {
      "displayName": "pricingTierStorageAccounts"
    },
    "allowedValues": [
      "Standard",
      "Free"
    ],
    "defaultValue": "Standard"
  },
  "pricingTierContainerRegistry": {
    "type": "String",
    "metadata": {
      "displayName": "pricingTierContainerRegistry"
    },
    "allowedValues": [
      "Standard",
      "Free"
    ],
    "defaultValue": "Standard"
  },
  "pricingTierKeyVaults": {
    "type": "String",
    "metadata": {
      "displayName": "pricingTierKeyVaults"
    },
    "allowedValues": [
      "Standard",
      "Free"
    ],
    "defaultValue": "Standard"
  },
  "pricingTierKubernetesService": {
    "type": "String",
    "metadata": {
      "displayName": "pricingTierKubernetesService"
    },
    "allowedValues": [
      "Standard",
      "Free"
    ],
    "defaultValue": "Standard"
  },
  "pricingSqlServerVirtualMachines": {
    "type": "String",
    "metadata": {
      "displayName": "pricingSqlServerVirtualMachines"
    },
    "allowedValues": [
      "Standard",
      "Free"
    ],
    "defaultValue": "Standard"
  }
}
PARAMETERS

}

output "policydefinition_deploy_asc_standard" {
  value = azurerm_policy_definition.deploy_asc_standard
}


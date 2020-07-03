policyDefinition-Deploy-ASC-Standard-policyrule = <<POLICYRULE
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
      "type": "Microsoft.Security/pricings",
      "deploymentscope": "subscription",
      "existencescope": "subscription",
      "roledefinitionids": [
        "/providers/Microsoft.Authorization/roleDefinitions/8e3af657-a8ff-443c-a75c-2fe8c4bcb635"
      ],
      "existencecondition": {
        "allof": [
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
            "emailsecuritycontact": {
              "value": "[parameters('emailSecurityContact')]"
            },
            "phonesecuritycontact": {
              "value": "[parameters('phoneSecurityContact')]"
            },
            "pricingtiervms": {
              "value": "[parameters('pricingTierVMs')]"
            },
            "pricingtiersqlservers": {
              "value": "[parameters('pricingTierSqlServers')]"
            },
            "pricingtierappservices": {
              "value": "[parameters('pricingTierAppServices')]"
            },
            "pricingtierstorageaccounts": {
              "value": "[parameters('pricingTierStorageAccounts')]"
            },
            "pricingtiercontainerregistry": {
              "value": "[parameters('pricingTierContainerRegistry')]"
            },
            "pricingtierkeyvaults": {
              "value": "[parameters('pricingTierKeyVaults')]"
            },
            "pricingtierkubernetesservice": {
              "value": "[parameters('pricingTierKubernetesService')]"
            },
            "pricingsqlservervirtualmachines": {
              "value": "[parameters('pricingSqlServerVirtualMachines')]"
            }
          },
          "template": {
            "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
            "contentversion": "1.0.0.0",
            "parameters": {
              "emailsecuritycontact": {
                "type": "string",
                "metadata": {
                  "description": "email address of the contact, in the form of john@doe.com"
                }
              },
              "phonesecuritycontact": {
                "type": "string",
                "metadata": {
                  "description": "phone number of the Security Contact"
                }
              },
              "pricingtiervms": {
                "type": "string",
                "metadata": {
                  "description": "pricingTierVMs"
                }
              },
              "pricingtiersqlservers": {
                "type": "string",
                "metadata": {
                  "description": "pricingTierSqlServers"
                }
              },
              "pricingtierappservices": {
                "type": "string",
                "metadata": {
                  "description": "pricingTierAppServices"
                }
              },
              "pricingtierstorageaccounts": {
                "type": "string",
                "metadata": {
                  "description": "pricingTierStorageAccounts"
                }
              },
              "pricingtiercontainerregistry": {
                "type": "string",
                "metadata": {
                  "description": "pricingTierContainerRegistry"
                }
              },
              "pricingtierkeyvaults": {
                "type": "string",
                "metadata": {
                  "description": "pricingTierKeyVaults"
                }
              },
              "pricingtierkubernetesservice": {
                "type": "string",
                "metadata": {
                  "description": "pricingTierKubernetesService"
                }
              },
              "pricingsqlservervirtualmachines": {
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
                "apiversion": "2017-08-01-preview",
                "properties": {
                  "email": "[parameters('emailSecurityContact')]",
                  "phone": "[parameters('phoneSecurityContact')]",
                  "alertnotifications": "On",
                  "alertstoadmins": "On"
                }
              },
              {
                "type": "Microsoft.Security/pricings",
                "apiversion": "2018-06-01",
                "name": "VirtualMachines",
                "properties": {
                  "pricingtier": "[parameters('pricingTierVMs')]"
                }
              },
              {
                "type": "Microsoft.Security/pricings",
                "apiversion": "2018-06-01",
                "name": "StorageAccounts",
                "dependson": [
                  "[concat('Microsoft.Security/pricings/VirtualMachines')]"
                ],
                "properties": {
                  "pricingtier": "[parameters('pricingTierStorageAccounts')]"
                }
              },
              {
                "type": "Microsoft.Security/pricings",
                "apiversion": "2018-06-01",
                "name": "AppServices",
                "dependson": [
                  "[concat('Microsoft.Security/pricings/StorageAccounts')]"
                ],
                "properties": {
                  "pricingtier": "[parameters('pricingTierAppServices')]"
                }
              },
              {
                "type": "Microsoft.Security/pricings",
                "apiversion": "2018-06-01",
                "name": "SqlServers",
                "dependson": [
                  "[concat('Microsoft.Security/pricings/AppServices')]"
                ],
                "properties": {
                  "pricingtier": "[parameters('pricingTierSqlServers')]"
                }
              },
              {
                "type": "Microsoft.Security/pricings",
                "apiversion": "2018-06-01",
                "name": "KeyVaults",
                "dependson": [
                  "[concat('Microsoft.Security/pricings/SqlServers')]"
                ],
                "properties": {
                  "pricingtier": "[parameters('pricingTierKeyVaults')]"
                }
              },
              {
                "type": "Microsoft.Security/pricings",
                "apiversion": "2018-06-01",
                "name": "KubernetesService",
                "dependson": [
                  "[concat('Microsoft.Security/pricings/KeyVaults')]"
                ],
                "properties": {
                  "pricingtier": "[parameters('pricingTierKubernetesService')]"
                }
              },
              {
                "type": "Microsoft.Security/pricings",
                "apiversion": "2018-06-01",
                "name": "ContainerRegistry",
                "dependson": [
                  "[concat('Microsoft.Security/pricings/KubernetesService')]"
                ],
                "properties": {
                  "pricingtier": "[parameters('pricingTierContainerRegistry')]"
                }
              },
              {
                "type": "Microsoft.Security/pricings",
                "apiversion": "2018-06-01",
                "name": "SqlServerVirtualMachines",
                "dependson": [
                  "[concat('Microsoft.Security/pricings/ContainerRegistry')]"
                ],
                "properties": {
                  "pricingtier": "[parameters('pricingSqlServerVirtualMachines')]"
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

policyDefinition-Deploy-ASC-Standard-parameters = <<PARAMETERS
{
  "emailsecuritycontact": {
    "type": "String",
    "metadata": {
      "displayname": "emailSecurityContact",
      "description": "email address of the contact, in the form of john@doe.com"
    }
  },
  "phonesecuritycontact": {
    "type": "String",
    "metadata": {
      "displayname": "phoneSecurityContact",
      "description": "phone number of the Security Contact"
    }
  },
  "pricingtiervms": {
    "type": "String",
    "metadata": {
      "displayname": "pricingTierVMs",
      "description": null
    },
    "allowedvalues": [
      "Standard",
      "Free"
    ],
    "defaultvalue": "Standard"
  },
  "pricingtiersqlservers": {
    "type": "String",
    "metadata": {
      "displayname": "pricingTierSqlServers",
      "description": null
    },
    "allowedvalues": [
      "Standard",
      "Free"
    ],
    "defaultvalue": "Standard"
  },
  "pricingtierappservices": {
    "type": "String",
    "metadata": {
      "displayname": "pricingTierAppServices",
      "description": null
    },
    "allowedvalues": [
      "Standard",
      "Free"
    ],
    "defaultvalue": "Standard"
  },
  "pricingtierstorageaccounts": {
    "type": "String",
    "metadata": {
      "displayname": "pricingTierStorageAccounts",
      "description": null
    },
    "allowedvalues": [
      "Standard",
      "Free"
    ],
    "defaultvalue": "Standard"
  },
  "pricingtiercontainerregistry": {
    "type": "String",
    "metadata": {
      "displayname": "pricingTierContainerRegistry",
      "description": null
    },
    "allowedvalues": [
      "Standard",
      "Free"
    ],
    "defaultvalue": "Standard"
  },
  "pricingtierkeyvaults": {
    "type": "String",
    "metadata": {
      "displayname": "pricingTierKeyVaults",
      "description": null
    },
    "allowedvalues": [
      "Standard",
      "Free"
    ],
    "defaultvalue": "Standard"
  },
  "pricingtierkubernetesservice": {
    "type": "String",
    "metadata": {
      "displayname": "pricingTierKubernetesService",
      "description": null
    },
    "allowedvalues": [
      "Standard",
      "Free"
    ],
    "defaultvalue": "Standard"
  },
  "pricingsqlservervirtualmachines": {
    "type": "String",
    "metadata": {
      "displayname": "pricingSqlServerVirtualMachines",
      "description": null
    },
    "allowedvalues": [
      "Standard",
      "Free"
    ],
    "defaultvalue": "Standard"
  }
}
PARAMETERS


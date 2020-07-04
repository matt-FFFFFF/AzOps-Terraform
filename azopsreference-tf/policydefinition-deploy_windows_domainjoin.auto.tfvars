policyDefinition_deploy_windows_domainjoin_policyrule = <<POLICYRULE
{
  "if": {
    "allof": [
      {
        "field": "type",
        "equals": "Microsoft.Compute/virtualMachines"
      },
      {
        "field": "Microsoft.Compute/imagePublisher",
        "equals": "MicrosoftWindowsServer"
      },
      {
        "field": "Microsoft.Compute/imageOffer",
        "equals": "WindowsServer"
      },
      {
        "field": "Microsoft.Compute/imageSKU",
        "in": [
          "2008-R2-SP1",
          "2008-R2-SP1-smalldisk",
          "2008-R2-SP1-zhcn",
          "2012-Datacenter",
          "2012-datacenter-gensecond",
          "2012-Datacenter-smalldisk",
          "2012-datacenter-smalldisk-g2",
          "2012-Datacenter-zhcn",
          "2012-datacenter-zhcn-g2",
          "2012-R2-Datacenter",
          "2012-r2-datacenter-gensecond",
          "2012-R2-Datacenter-smalldisk",
          "2012-r2-datacenter-smalldisk-g2",
          "2012-R2-Datacenter-zhcn",
          "2012-r2-datacenter-zhcn-g2",
          "2016-Datacenter",
          "2016-datacenter-gensecond",
          "2016-datacenter-gs",
          "2016-Datacenter-Server-Core",
          "2016-datacenter-server-core-g2",
          "2016-Datacenter-Server-Core-smalldisk",
          "2016-datacenter-server-core-smalldisk-g2",
          "2016-Datacenter-smalldisk",
          "2016-datacenter-smalldisk-g2",
          "2016-Datacenter-with-Containers",
          "2016-datacenter-with-containers-g2",
          "2016-Datacenter-with-RDSH",
          "2016-Datacenter-zhcn",
          "2016-datacenter-zhcn-g2",
          "2019-Datacenter",
          "2019-Datacenter-Core",
          "2019-datacenter-core-g2",
          "2019-Datacenter-Core-smalldisk",
          "2019-datacenter-core-smalldisk-g2",
          "2019-Datacenter-Core-with-Containers",
          "2019-datacenter-core-with-containers-g2",
          "2019-Datacenter-Core-with-Containers-smalldisk",
          "2019-datacenter-core-with-containers-smalldisk-g2",
          "2019-datacenter-gensecond",
          "2019-datacenter-gs",
          "2019-Datacenter-smalldisk",
          "2019-datacenter-smalldisk-g2",
          "2019-Datacenter-with-Containers",
          "2019-datacenter-with-containers-g2",
          "2019-Datacenter-with-Containers-smalldisk",
          "2019-datacenter-with-containers-smalldisk-g2",
          "2019-Datacenter-zhcn",
          "2019-datacenter-zhcn-g2",
          "Datacenter-Core-1803-with-Containers-smalldisk",
          "datacenter-core-1803-with-containers-smalldisk-g2",
          "Datacenter-Core-1809-with-Containers-smalldisk",
          "datacenter-core-1809-with-containers-smalldisk-g2",
          "Datacenter-Core-1903-with-Containers-smalldisk",
          "datacenter-core-1903-with-containers-smalldisk-g2",
          "datacenter-core-1909-with-containers-smalldisk",
          "datacenter-core-1909-with-containers-smalldisk-g1",
          "datacenter-core-1909-with-containers-smalldisk-g2"
        ]
      }
    ]
  },
  "then": {
    "effect": "deployIfNotExists",
    "details": {
      "type": "Microsoft.Compute/virtualMachines/extensions",
      "roledefinitionids": [
        "/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c"
      ],
      "existencecondition": {
        "allof": [
          {
            "field": "Microsoft.Compute/virtualMachines/extensions/type",
            "equals": "JsonADDomainExtension"
          },
          {
            "field": "Microsoft.Compute/virtualMachines/extensions/publisher",
            "equals": "Microsoft.Compute"
          }
        ]
      },
      "deployment": {
        "properties": {
          "mode": "incremental",
          "parameters": {
            "vmname": {
              "value": "[field('name')]"
            },
            "location": {
              "value": "[field('location')]"
            },
            "domainusername": {
              "reference": {
                "keyvault": {
                  "id": "[parameters('keyVaultResourceId')]"
                },
                "secretname": "[parameters('domainUsername')]"
              }
            },
            "domainpassword": {
              "reference": {
                "keyvault": {
                  "id": "[parameters('keyVaultResourceId')]"
                },
                "secretname": "[parameters('domainPassword')]"
              }
            },
            "domainoupath": {
              "value": "[parameters('domainOUPath')]"
            },
            "domainfqdn": {
              "value": "[parameters('domainFQDN')]"
            },
            "keyvaultresourceid": {
              "value": "[parameters('keyVaultResourceId')]"
            }
          },
          "template": {
            "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
            "contentversion": "1.0.0.0",
            "parameters": {
              "vmname": {
                "type": "string"
              },
              "location": {
                "type": "string"
              },
              "domainusername": {
                "type": "string"
              },
              "domainpassword": {
                "type": "securestring"
              },
              "domainfqdn": {
                "type": "string"
              },
              "domainoupath": {
                "type": "string"
              },
              "keyvaultresourceid": {
                "type": "string"
              }
            },
            "variables": {
              "domainjoinoptions": 3,
              "vmname": "[parameters('vmName')]"
            },
            "resources": [
              {
                "apiversion": "2015-06-15",
                "type": "Microsoft.Compute/virtualMachines/extensions",
                "name": "[concat(variables('vmName'),'/joindomain')]",
                "location": "[resourceGroup().location]",
                "properties": {
                  "publisher": "Microsoft.Compute",
                  "type": "JsonADDomainExtension",
                  "typehandlerversion": "1.3",
                  "autoupgrademinorversion": true,
                  "settings": {
                    "name": "[parameters('domainFQDN')]",
                    "user": "[parameters('domainUserName')]",
                    "restart": "true",
                    "options": "[variables('domainJoinOptions')]",
                    "oupath": "[parameters('domainOUPath')]"
                  },
                  "protectedsettings": {
                    "password": "[parameters('domainPassword')]"
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

policyDefinition_deploy_windows_domainjoin_parameters = <<PARAMETERS
{
  "domainusername": {
    "type": "String",
    "metadata": {
      "displayname": "domainUsername",
      "description": null
    }
  },
  "domainpassword": {
    "type": "String",
    "metadata": {
      "displayname": "domainPassword",
      "description": null
    }
  },
  "domainfqdn": {
    "type": "String",
    "metadata": {
      "displayname": "domainFQDN",
      "description": null
    }
  },
  "domainoupath": {
    "type": "String",
    "metadata": {
      "displayname": "domainOUPath",
      "description": null
    }
  },
  "keyvaultresourceid": {
    "type": "String",
    "metadata": {
      "displayname": "keyVaultResourceId",
      "description": null
    }
  }
}
PARAMETERS


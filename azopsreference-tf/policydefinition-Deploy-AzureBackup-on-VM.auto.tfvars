policyDefinition-Deploy-AzureBackup-on-VM-policyrule = <<POLICYRULE
{
  "if": {
    "allof": [
      {
        "field": "type",
        "equals": "Microsoft.Compute/virtualMachines"
      },
      {
        "anyof": [
          {
            "allof": [
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
                  "2012-Datacenter",
                  "2012-Datacenter-smalldisk",
                  "2012-R2-Datacenter",
                  "2012-R2-Datacenter-smalldisk",
                  "2016-Datacenter",
                  "2016-Datacenter-Server-Core",
                  "2016-Datacenter-Server-Core-smalldisk",
                  "2016-Datacenter-smalldisk",
                  "2016-Datacenter-with-Containers",
                  "2016-Datacenter-with-RDSH",
                  "2019-Datacenter",
                  "2019-Datacenter-Core",
                  "2019-Datacenter-Core-smalldisk",
                  "2019-Datacenter-Core-with-Containers",
                  "2019-Datacenter-Core-with-Containers-smalldisk",
                  "2019-Datacenter-smalldisk",
                  "2019-Datacenter-with-Containers",
                  "2019-Datacenter-with-Containers-smalldisk",
                  "2019-Datacenter-zhcn"
                ]
              }
            ]
          },
          {
            "allof": [
              {
                "field": "Microsoft.Compute/imagePublisher",
                "equals": "MicrosoftWindowsServer"
              },
              {
                "field": "Microsoft.Compute/imageOffer",
                "equals": "WindowsServerSemiAnnual"
              },
              {
                "field": "Microsoft.Compute/imageSKU",
                "in": [
                  "Datacenter-Core-1709-smalldisk",
                  "Datacenter-Core-1709-with-Containers-smalldisk",
                  "Datacenter-Core-1803-with-Containers-smalldisk"
                ]
              }
            ]
          },
          {
            "allof": [
              {
                "field": "Microsoft.Compute/imagePublisher",
                "equals": "MicrosoftWindowsServerHPCPack"
              },
              {
                "field": "Microsoft.Compute/imageOffer",
                "equals": "WindowsServerHPCPack"
              }
            ]
          },
          {
            "allof": [
              {
                "field": "Microsoft.Compute/imagePublisher",
                "equals": "MicrosoftSQLServer"
              },
              {
                "anyof": [
                  {
                    "field": "Microsoft.Compute/imageOffer",
                    "like": "*-WS2016"
                  },
                  {
                    "field": "Microsoft.Compute/imageOffer",
                    "like": "*-WS2016-BYOL"
                  },
                  {
                    "field": "Microsoft.Compute/imageOffer",
                    "like": "*-WS2012R2"
                  },
                  {
                    "field": "Microsoft.Compute/imageOffer",
                    "like": "*-WS2012R2-BYOL"
                  }
                ]
              }
            ]
          },
          {
            "allof": [
              {
                "field": "Microsoft.Compute/imagePublisher",
                "equals": "MicrosoftRServer"
              },
              {
                "field": "Microsoft.Compute/imageOffer",
                "equals": "MLServer-WS2016"
              }
            ]
          },
          {
            "allof": [
              {
                "field": "Microsoft.Compute/imagePublisher",
                "equals": "MicrosoftVisualStudio"
              },
              {
                "field": "Microsoft.Compute/imageOffer",
                "in": [
                  "VisualStudio",
                  "Windows"
                ]
              }
            ]
          },
          {
            "allof": [
              {
                "field": "Microsoft.Compute/imagePublisher",
                "equals": "MicrosoftDynamicsAX"
              },
              {
                "field": "Microsoft.Compute/imageOffer",
                "equals": "Dynamics"
              },
              {
                "field": "Microsoft.Compute/imageSKU",
                "equals": "Pre-Req-AX7-Onebox-U8"
              }
            ]
          },
          {
            "allof": [
              {
                "field": "Microsoft.Compute/imagePublisher",
                "equals": "microsoft-ads"
              },
              {
                "field": "Microsoft.Compute/imageOffer",
                "equals": "windows-data-science-vm"
              }
            ]
          },
          {
            "allof": [
              {
                "field": "Microsoft.Compute/imagePublisher",
                "equals": "MicrosoftWindowsDesktop"
              },
              {
                "field": "Microsoft.Compute/imageOffer",
                "equals": "Windows-10"
              }
            ]
          },
          {
            "allof": [
              {
                "field": "Microsoft.Compute/imagePublisher",
                "equals": "RedHat"
              },
              {
                "field": "Microsoft.Compute/imageOffer",
                "in": [
                  "RHEL",
                  "RHEL-SAP-HANA"
                ]
              },
              {
                "anyof": [
                  {
                    "field": "Microsoft.Compute/imageSKU",
                    "like": "6.*"
                  },
                  {
                    "field": "Microsoft.Compute/imageSKU",
                    "like": "7*"
                  }
                ]
              }
            ]
          },
          {
            "allof": [
              {
                "field": "Microsoft.Compute/imagePublisher",
                "equals": "SUSE"
              },
              {
                "field": "Microsoft.Compute/imageOffer",
                "in": [
                  "SLES",
                  "SLES-HPC",
                  "SLES-HPC-Priority",
                  "SLES-SAP",
                  "SLES-SAP-BYOS",
                  "SLES-Priority",
                  "SLES-BYOS",
                  "SLES-SAPCAL",
                  "SLES-Standard"
                ]
              },
              {
                "anyof": [
                  {
                    "field": "Microsoft.Compute/imageSKU",
                    "like": "12*"
                  }
                ]
              }
            ]
          },
          {
            "allof": [
              {
                "field": "Microsoft.Compute/imagePublisher",
                "equals": "Canonical"
              },
              {
                "field": "Microsoft.Compute/imageOffer",
                "equals": "UbuntuServer"
              },
              {
                "anyof": [
                  {
                    "field": "Microsoft.Compute/imageSKU",
                    "like": "14.04*LTS"
                  },
                  {
                    "field": "Microsoft.Compute/imageSKU",
                    "like": "16.04*LTS"
                  },
                  {
                    "field": "Microsoft.Compute/imageSKU",
                    "like": "18.04*LTS"
                  }
                ]
              }
            ]
          },
          {
            "allof": [
              {
                "field": "Microsoft.Compute/imagePublisher",
                "equals": "Oracle"
              },
              {
                "field": "Microsoft.Compute/imageOffer",
                "equals": "Oracle-Linux"
              },
              {
                "anyof": [
                  {
                    "field": "Microsoft.Compute/imageSKU",
                    "like": "6.*"
                  },
                  {
                    "field": "Microsoft.Compute/imageSKU",
                    "like": "7.*"
                  }
                ]
              }
            ]
          },
          {
            "allof": [
              {
                "field": "Microsoft.Compute/imagePublisher",
                "equals": "OpenLogic"
              },
              {
                "field": "Microsoft.Compute/imageOffer",
                "in": [
                  "CentOS",
                  "Centos-LVM",
                  "CentOS-SRIOV"
                ]
              },
              {
                "anyof": [
                  {
                    "field": "Microsoft.Compute/imageSKU",
                    "like": "6.*"
                  },
                  {
                    "field": "Microsoft.Compute/imageSKU",
                    "like": "7*"
                  }
                ]
              }
            ]
          },
          {
            "allof": [
              {
                "field": "Microsoft.Compute/imagePublisher",
                "equals": "cloudera"
              },
              {
                "field": "Microsoft.Compute/imageOffer",
                "equals": "cloudera-centos-os"
              },
              {
                "field": "Microsoft.Compute/imageSKU",
                "like": "7*"
              }
            ]
          }
        ]
      }
    ]
  },
  "then": {
    "effect": "deployIfNotExists",
    "details": {
      "resourcegroupname": "[resourceGroup().name]",
      "type": "Microsoft.RecoveryServices/backupprotecteditems",
      "roledefinitionids": [
        "/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c"
      ],
      "existencecondition": {
        "field": "name",
        "like": "*"
      },
      "deployment": {
        "properties": {
          "mode": "incremental",
          "template": {
            "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
            "contentversion": "1.0.0.0",
            "parameters": {
              "vmname": {
                "type": "string",
                "metadata": {
                  "description": "Name of Azure Virtual Machines"
                }
              },
              "vmrgname": {
                "type": "string",
                "metadata": {
                  "description": "Resource group containing the virtual machines."
                }
              },
              "location": {
                "type": "string",
                "metadata": {
                  "description": "Location for VM and Backup vault"
                }
              }
            },
            "variables": {
              "backupfabric": "Azure",
              "backuppolicy": "DefaultPolicy",
              "v2vmtype": "Microsoft.Compute/virtualMachines",
              "v2vmcontainer": "iaasvmcontainer;iaasvmcontainerv2;",
              "v2vm": "vm;iaasvmcontainerv2;",
              "vaultname": "[concat(resourceGroup().name, '-backupvault')]"
            },
            "resources": [
              {
                "name": "[variables('vaultName')]",
                "type": "Microsoft.RecoveryServices/vaults",
                "apiversion": "2016-06-01",
                "location": "[parameters('location')]",
                "properties": {},
                "sku": {
                  "name": "Standard"
                }
              },
              {
                "name": "[concat(variables('vaultName'), '/', variables('backupFabric'), '/', variables('v2VmContainer'), concat(parameters('vmRgName'),';',parameters('vmName')), '/', variables('v2Vm'), concat(parameters('vmRgName'),';',parameters('vmName')))]",
                "apiversion": "2016-12-01",
                "location": "[parameters('location')]",
                "type": "Microsoft.RecoveryServices/vaults/backupFabrics/protectionContainers/protectedItems",
                "dependson": [
                  "[resourceId('Microsoft.RecoveryServices/vaults/', variables('vaultName'))]"
                ],
                "properties": {
                  "protecteditemtype": "[variables('v2VmType')]",
                  "policyid": "[resourceId('Microsoft.RecoveryServices/vaults/backupPolicies', variables('vaultName'),variables('backupPolicy'))]",
                  "sourceresourceid": "[concat('/subscriptions/', subscription().subscriptionId, '/resourceGroups/', parameters('vmRgName'), '/providers/Microsoft.Compute/virtualMachines/', parameters('vmName'))]"
                }
              }
            ],
            "outputs": {
              "status": {
                "type": "string",
                "value": "[concat('Backup enabled successfully for VM:', ' ', parameters('vmName'))]"
              }
            }
          },
          "parameters": {
            "vmname": {
              "value": "[field('name')]"
            },
            "location": {
              "value": "[field('location')]"
            },
            "vmrgname": {
              "value": "[resourceGroup().name]"
            }
          }
        }
      }
    }
  }
}
POLICYRULE


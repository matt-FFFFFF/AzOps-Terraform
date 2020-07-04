policyDefinition_deploy_la_config_policyrule = <<POLICYRULE
{
  "if": {
    "allof": [
      {
        "field": "type",
        "equals": "Microsoft.OperationalInsights/workspaces"
      }
    ]
  },
  "then": {
    "effect": "deployIfNotExists",
    "details": {
      "type": "Microsoft.OperationalInsights/workspaces",
      "deploymentscope": "resourceGroup",
      "existencescope": "Subscription",
      "roledefinitionids": [
        "/providers/Microsoft.Authorization/roleDefinitions/8e3af657-a8ff-443c-a75c-2fe8c4bcb635"
      ],
      "existencecondition": {
        "allof": [
          {
            "field": "name",
            "like": "[parameters('workspaceName')]"
          },
          {
            "field": "location",
            "equals": "[parameters('workspaceRegion')]"
          }
        ]
      },
      "deployment": {
        "properties": {
          "mode": "incremental",
          "parameters": {
            "workspacename": {
              "value": "[parameters('workspaceName')]"
            },
            "workspaceregion": {
              "value": "[parameters('workspaceRegion')]"
            }
          },
          "template": {
            "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
            "contentversion": "1.0.0.0",
            "parameters": {
              "workspacename": {
                "type": "string"
              },
              "workspaceregion": {
                "type": "string"
              }
            },
            "variables": {
              "vminsightsperfcounters": {
                "windowsarray": [
                  {
                    "armname": "counter1",
                    "objectname": "LogicalDisk",
                    "countername": "% Free Space",
                    "instancename": "*",
                    "intervalseconds": 10
                  },
                  {
                    "armname": "counter2",
                    "objectname": "LogicalDisk",
                    "countername": "Avg. Disk sec/Read",
                    "instancename": "*",
                    "intervalseconds": 10
                  },
                  {
                    "armname": "counter3",
                    "objectname": "LogicalDisk",
                    "countername": "Avg. Disk sec/Transfer",
                    "instancename": "*",
                    "intervalseconds": 10
                  },
                  {
                    "armname": "counter4",
                    "objectname": "LogicalDisk",
                    "countername": "Avg. Disk sec/Write",
                    "instancename": "*",
                    "intervalseconds": 10
                  },
                  {
                    "armname": "counter5",
                    "objectname": "LogicalDisk",
                    "countername": "Disk Read Bytes/sec",
                    "instancename": "*",
                    "intervalseconds": 10
                  },
                  {
                    "armname": "counter6",
                    "objectname": "LogicalDisk",
                    "countername": "Disk Reads/sec",
                    "instancename": "*",
                    "intervalseconds": 10
                  },
                  {
                    "armname": "counter7",
                    "objectname": "LogicalDisk",
                    "countername": "Disk Transfers/sec",
                    "instancename": "*",
                    "intervalseconds": 10
                  },
                  {
                    "armname": "counter8",
                    "objectname": "LogicalDisk",
                    "countername": "Disk Write Bytes/sec",
                    "instancename": "*",
                    "intervalseconds": 10
                  },
                  {
                    "armname": "counter9",
                    "objectname": "LogicalDisk",
                    "countername": "Disk Writes/sec",
                    "instancename": "*",
                    "intervalseconds": 10
                  },
                  {
                    "armname": "counter10",
                    "objectname": "LogicalDisk",
                    "countername": "Free Megabytes",
                    "instancename": "*",
                    "intervalseconds": 10
                  },
                  {
                    "armname": "counter11",
                    "objectname": "Memory",
                    "countername": "Available MBytes",
                    "instancename": "*",
                    "intervalseconds": 10
                  },
                  {
                    "armname": "counter12",
                    "objectname": "Network Adapter",
                    "countername": "Bytes Received/sec",
                    "instancename": "*",
                    "intervalseconds": 10
                  },
                  {
                    "armname": "counter13",
                    "objectname": "Network Adapter",
                    "countername": "Bytes Sent/sec",
                    "instancename": "*",
                    "intervalseconds": 10
                  },
                  {
                    "armname": "counter14",
                    "objectname": "Processor",
                    "countername": "% Processor Time",
                    "instancename": "*",
                    "intervalseconds": 10
                  }
                ],
                "linuxdiskarray": [
                  {
                    "countername": "% Used Inodes"
                  },
                  {
                    "countername": "Free Megabytes"
                  },
                  {
                    "countername": "% Used Space"
                  },
                  {
                    "countername": "Disk Transfers/sec"
                  },
                  {
                    "countername": "Disk Reads/sec"
                  },
                  {
                    "countername": "Disk writes/sec"
                  }
                ],
                "linuxdiskobject": {
                  "armresourcename": "Disk",
                  "objectname": "Logical Disk",
                  "instancename": "*",
                  "intervalseconds": 10
                },
                "linuxmemoryarray": [
                  {
                    "countername": "Available MBytes Memory"
                  }
                ],
                "linuxmemoryobject": {
                  "armresourcename": "Memory",
                  "objectname": "Memory",
                  "instancename": "*",
                  "intervalseconds": 10
                },
                "linuxnetworkarray": [
                  {
                    "countername": "Total Bytes Received"
                  },
                  {
                    "countername": "Total Bytes Transmitted"
                  }
                ],
                "linuxnetworkobject": {
                  "armresourcename": "Network",
                  "objectname": "Network",
                  "instancename": "*",
                  "intervalseconds": 10
                },
                "linuxcpuarray": [
                  {
                    "countername": "% Processor Time"
                  }
                ],
                "linuxcpuobject": {
                  "armresourcename": "Processor",
                  "objectname": "Processor",
                  "instancename": "*",
                  "intervalseconds": 10
                }
              },
              "batch1": {
                "solutions": [
                  {
                    "name": "[concat('Security', '(', parameters('workspaceName'), ')')]",
                    "marketplacename": "Security"
                  },
                  {
                    "name": "[concat('AgentHealthAssessment', '(', parameters('workspaceName'), ')')]",
                    "marketplacename": "AgentHealthAssessment"
                  },
                  {
                    "name": "[concat('ChangeTracking', '(', parameters('workspaceName'), ')')]",
                    "marketplacename": "ChangeTracking"
                  },
                  {
                    "name": "[concat('Updates', '(', parameters('workspaceName'), ')')]",
                    "marketplacename": "Updates"
                  },
                  {
                    "name": "[concat('AzureActivity', '(', parameters('workspaceName'), ')')]",
                    "marketplacename": "AzureActivity"
                  },
                  {
                    "name": "[concat('AzureAutomation', '(', parameters('workspaceName'), ')')]",
                    "marketplacename": "AzureAutomation"
                  },
                  {
                    "name": "[concat('ADAssessment', '(', parameters('workspaceName'), ')')]",
                    "marketplacename": "ADAssessment"
                  },
                  {
                    "name": "[concat('SQLAssessment', '(', parameters('workspaceName'), ')')]",
                    "marketplacename": "SQLAssessment"
                  },
                  {
                    "name": "[concat('VMInsights', '(', parameters('workspaceName'), ')')]",
                    "marketplacename": "VMInsights"
                  },
                  {
                    "name": "[concat('ServiceMap', '(', parameters('workspaceName'), ')')]",
                    "marketplacename": "ServiceMap"
                  },
                  {
                    "name": "[concat('SecurityInsights', '(', parameters('workspaceName'), ')')]",
                    "marketplacename": "SecurityInsights"
                  }
                ]
              }
            },
            "resources": [
              {
                "apiversion": "2015-11-01-preview",
                "type": "Microsoft.OperationalInsights/workspaces/datasources",
                "name": "[concat(parameters('workspaceName'), '/LinuxPerfCollection')]",
                "kind": "LinuxPerformanceCollection",
                "properties": {
                  "state": "Enabled"
                }
              },
              {
                "apiversion": "2015-11-01-preview",
                "type": "Microsoft.OperationalInsights/workspaces/dataSources",
                "name": "[concat(parameters('workspaceName'), '/', variables('vmInsightsPerfCounters').linuxDiskObject.armResourceName)]",
                "kind": "LinuxPerformanceObject",
                "properties": {
                  "performancecounters": "[variables('vmInsightsPerfCounters').linuxDiskArray]",
                  "objectname": "[variables('vmInsightsPerfCounters').linuxDiskObject.objectName]",
                  "instancename": "[variables('vmInsightsPerfCounters').linuxDiskObject.instanceName]",
                  "intervalseconds": "[variables('vmInsightsPerfCounters').linuxDiskObject.intervalSeconds]"
                }
              },
              {
                "apiversion": "2015-11-01-preview",
                "type": "Microsoft.OperationalInsights/workspaces/dataSources",
                "name": "[concat(parameters('workspaceName'), '/', variables('vmInsightsPerfCounters').linuxMemoryObject.armResourceName)]",
                "kind": "LinuxPerformanceObject",
                "properties": {
                  "performancecounters": "[variables('vmInsightsPerfCounters').linuxMemoryArray]",
                  "objectname": "[variables('vmInsightsPerfCounters').linuxMemoryObject.objectName]",
                  "instancename": "[variables('vmInsightsPerfCounters').linuxMemoryObject.instanceName]",
                  "intervalseconds": "[variables('vmInsightsPerfCounters').linuxMemoryObject.intervalSeconds]"
                }
              },
              {
                "apiversion": "2015-11-01-preview",
                "type": "Microsoft.OperationalInsights/workspaces/dataSources",
                "name": "[concat(parameters('workspaceName'), '/', variables('vmInsightsPerfCounters').linuxCpuObject.armResourceName)]",
                "kind": "LinuxPerformanceObject",
                "properties": {
                  "performancecounters": "[variables('vmInsightsPerfCounters').linuxCpuArray]",
                  "objectname": "[variables('vmInsightsPerfCounters').linuxCpuObject.objectName]",
                  "instancename": "[variables('vmInsightsPerfCounters').linuxCpuObject.instanceName]",
                  "intervalseconds": "[variables('vmInsightsPerfCounters').linuxCpuObject.intervalSeconds]"
                }
              },
              {
                "apiversion": "2015-11-01-preview",
                "type": "Microsoft.OperationalInsights/workspaces/dataSources",
                "name": "[concat(parameters('workspaceName'), '/', variables('vmInsightsPerfCounters').linuxNetworkObject.armResourceName)]",
                "kind": "LinuxPerformanceObject",
                "properties": {
                  "performancecounters": "[variables('vmInsightsPerfCounters').linuxNetworkArray]",
                  "objectname": "[variables('vmInsightsPerfCounters').linuxNetworkObject.objectName]",
                  "instancename": "[variables('vmInsightsPerfCounters').linuxNetworkObject.instanceName]",
                  "intervalseconds": "[variables('vmInsightsPerfCounters').linuxNetworkObject.intervalSeconds]"
                }
              },
              {
                "apiversion": "2015-11-01-preview",
                "type": "Microsoft.OperationalInsights/workspaces/dataSources",
                "name": "[concat(parameters('workspaceName'), '/', variables('vmInsightsPerfCounters').windowsArray[copyIndex()].armName)]",
                "kind": "WindowsPerformanceCounter",
                "copy": {
                  "name": "counterCopy",
                  "count": "[length(variables('vmInsightsPerfCounters').windowsArray)]"
                },
                "properties": {
                  "objectname": "[variables('vmInsightsPerfCounters').windowsArray[copyIndex()].objectName]",
                  "instancename": "[variables('vmInsightsPerfCounters').windowsArray[copyIndex()].instanceName]",
                  "intervalseconds": "[variables('vmInsightsPerfCounters').windowsArray[copyIndex()].intervalSeconds]",
                  "countername": "[variables('vmInsightsPerfCounters').windowsArray[copyIndex()].counterName]"
                }
              },
              {
                "apiversion": "2015-11-01-preview",
                "type": "Microsoft.OperationsManagement/solutions",
                "name": "[concat(variables('batch1').solutions[copyIndex()].Name)]",
                "location": "[parameters('workspaceRegion')]",
                "copy": {
                  "name": "solutionCopy",
                  "count": "[length(variables('batch1').solutions)]"
                },
                "properties": {
                  "workspaceresourceid": "[resourceId('Microsoft.OperationalInsights/workspaces/', parameters('workspaceName'))]"
                },
                "plan": {
                  "name": "[variables('batch1').solutions[copyIndex()].name]",
                  "product": "[concat('OMSGallery/', variables('batch1').solutions[copyIndex()].marketplaceName)]",
                  "promotioncode": "",
                  "publisher": "Microsoft"
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

policyDefinition_deploy_la_config_parameters = <<PARAMETERS
{
  "workspacename": {
    "type": "String",
    "metadata": {
      "displayname": "workspaceName",
      "description": "Provide name of existing Log Analytics workspace"
    }
  },
  "workspaceregion": {
    "type": "String",
    "metadata": {
      "displayname": "workspaceRegion",
      "description": "Select region of existing Log Analytics workspace"
    }
  }
}
PARAMETERS


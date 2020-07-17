# This file was auto generated
resource "azurerm_policy_set_definition" "deploy_diag_loganalytics" {
  name                  = "Deploy-Diag-LogAnalytics"
  policy_type           = "Custom"
  display_name          = "Deploy-Diag-LogAnalytics"
  description           = "This initiative configures application Azure resources to forward diagnostic logs and metrics to an Azure Log Analytics workspace."
  management_group_name = var.management_group_name
  depends_on = [
    azurerm_policy_definition.deploy_diagnostics_aa,
    azurerm_policy_definition.deploy_diagnostics_aci,
    azurerm_policy_definition.deploy_diagnostics_acr,
    azurerm_policy_definition.deploy_diagnostics_aks,
    azurerm_policy_definition.deploy_diagnostics_analysisservice,
    azurerm_policy_definition.deploy_diagnostics_apimgmt,
    azurerm_policy_definition.deploy_diagnostics_applicationgateway,
    azurerm_policy_definition.deploy_diagnostics_batch,
    azurerm_policy_definition.deploy_diagnostics_cdnendpoints,
    azurerm_policy_definition.deploy_diagnostics_cognitiveservices,
    azurerm_policy_definition.deploy_diagnostics_cosmosdb,
    azurerm_policy_definition.deploy_diagnostics_datafactory,
    azurerm_policy_definition.deploy_diagnostics_datalakestore,
    azurerm_policy_definition.deploy_diagnostics_dlanalytics,
    azurerm_policy_definition.deploy_diagnostics_eventgridsub,
    azurerm_policy_definition.deploy_diagnostics_eventgridtopic,
    azurerm_policy_definition.deploy_diagnostics_eventhub,
    azurerm_policy_definition.deploy_diagnostics_expressroute,
    azurerm_policy_definition.deploy_diagnostics_firewall,
    azurerm_policy_definition.deploy_diagnostics_hdinsight,
    azurerm_policy_definition.deploy_diagnostics_iothub,
    azurerm_policy_definition.deploy_diagnostics_keyvault,
    azurerm_policy_definition.deploy_diagnostics_loadbalancer,
    azurerm_policy_definition.deploy_diagnostics_logicappsise,
    azurerm_policy_definition.deploy_diagnostics_logicappswf,
    azurerm_policy_definition.deploy_diagnostics_mlworkspace,
    azurerm_policy_definition.deploy_diagnostics_mysql,
    azurerm_policy_definition.deploy_diagnostics_networksecuritygroups,
    azurerm_policy_definition.deploy_diagnostics_nic,
    azurerm_policy_definition.deploy_diagnostics_postgresql,
    azurerm_policy_definition.deploy_diagnostics_powerbiembedded,
    azurerm_policy_definition.deploy_diagnostics_publicip,
    azurerm_policy_definition.deploy_diagnostics_recoveryvault,
    azurerm_policy_definition.deploy_diagnostics_rediscache,
    azurerm_policy_definition.deploy_diagnostics_relay,
    azurerm_policy_definition.deploy_diagnostics_searchservices,
    azurerm_policy_definition.deploy_diagnostics_servicebus,
    azurerm_policy_definition.deploy_diagnostics_signalr,
    azurerm_policy_definition.deploy_diagnostics_sqldbs,
    azurerm_policy_definition.deploy_diagnostics_sqlelasticpools,
    azurerm_policy_definition.deploy_diagnostics_sqlmi,
    azurerm_policy_definition.deploy_diagnostics_streamanalytics,
    azurerm_policy_definition.deploy_diagnostics_timeseriesinsights,
    azurerm_policy_definition.deploy_diagnostics_trafficmanager,
    azurerm_policy_definition.deploy_diagnostics_virtualnetwork,
    azurerm_policy_definition.deploy_diagnostics_vm,
    azurerm_policy_definition.deploy_diagnostics_vmss,
    azurerm_policy_definition.deploy_diagnostics_vnetgw,
    azurerm_policy_definition.deploy_diagnostics_webserverfarm,
    azurerm_policy_definition.deploy_diagnostics_website,
  ]
  policy_definitions = <<POLICYDEFINITIONS
[
  {
    "policyDefinitionReferenceId": "DeployDiagnosticsAA",
    "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-AA",
    "parameters": {
      "logAnalytics": {
        "value": "[parameters('logAnalytics')]"
      }
    }
  },
  {
    "policyDefinitionReferenceId": "DeployDiagnosticsPublicIP",
    "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-PublicIP",
    "parameters": {
      "logAnalytics": {
        "value": "[parameters('logAnalytics')]"
      }
    }
  },
  {
    "policyDefinitionReferenceId": "DeployDiagnosticsLoadBalancer",
    "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-LoadBalancer",
    "parameters": {
      "logAnalytics": {
        "value": "[parameters('logAnalytics')]"
      }
    }
  },
  {
    "policyDefinitionReferenceId": "DeployDiagnosticsNetworkSecurityGroups",
    "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-NetworkSecurityGroups",
    "parameters": {
      "logAnalytics": {
        "value": "[parameters('logAnalytics')]"
      }
    }
  },
  {
    "policyDefinitionReferenceId": "DeployDiagnosticsKeyVault",
    "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-KeyVault",
    "parameters": {
      "logAnalytics": {
        "value": "[parameters('logAnalytics')]"
      }
    }
  },
  {
    "policyDefinitionReferenceId": "DeployDiagnosticsCognitiveServices",
    "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-CognitiveServices",
    "parameters": {
      "logAnalytics": {
        "value": "[parameters('logAnalytics')]"
      }
    }
  },
  {
    "policyDefinitionReferenceId": "DeployDiagnosticsDLAnalytics",
    "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-DLAnalytics",
    "parameters": {
      "logAnalytics": {
        "value": "[parameters('logAnalytics')]"
      }
    }
  },
  {
    "policyDefinitionReferenceId": "DeployDiagnosticsDataLakeStore",
    "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-DataLakeStore",
    "parameters": {
      "logAnalytics": {
        "value": "[parameters('logAnalytics')]"
      }
    }
  },
  {
    "policyDefinitionReferenceId": "DeployDiagnosticsEventHub",
    "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-EventHub",
    "parameters": {
      "logAnalytics": {
        "value": "[parameters('logAnalytics')]"
      }
    }
  },
  {
    "policyDefinitionReferenceId": "DeployDiagnosticsiotHub",
    "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-iotHub",
    "parameters": {
      "logAnalytics": {
        "value": "[parameters('logAnalytics')]"
      }
    }
  },
  {
    "policyDefinitionReferenceId": "DeployDiagnosticsLogicAppsWF",
    "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-LogicAppsWF",
    "parameters": {
      "logAnalytics": {
        "value": "[parameters('logAnalytics')]"
      }
    }
  },
  {
    "policyDefinitionReferenceId": "DeployDiagnosticsLogicAppsISE",
    "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-LogicAppsISE",
    "parameters": {
      "logAnalytics": {
        "value": "[parameters('logAnalytics')]"
      }
    }
  },
  {
    "policyDefinitionReferenceId": "DeployDiagnosticsRecoveryVault",
    "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-RecoveryVault",
    "parameters": {
      "logAnalytics": {
        "value": "[parameters('logAnalytics')]"
      }
    }
  },
  {
    "policyDefinitionReferenceId": "DeployDiagnosticsSearchServices",
    "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-SearchServices",
    "parameters": {
      "logAnalytics": {
        "value": "[parameters('logAnalytics')]"
      }
    }
  },
  {
    "policyDefinitionReferenceId": "DeployDiagnosticsServiceBus",
    "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-ServiceBus",
    "parameters": {
      "logAnalytics": {
        "value": "[parameters('logAnalytics')]"
      }
    }
  },
  {
    "policyDefinitionReferenceId": "DeployDiagnosticsSQLDBs",
    "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-SQLDBs",
    "parameters": {
      "logAnalytics": {
        "value": "[parameters('logAnalytics')]"
      }
    }
  },
  {
    "policyDefinitionReferenceId": "DeployDiagnosticsSQLElasticPools",
    "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-SQLElasticPools",
    "parameters": {
      "logAnalytics": {
        "value": "[parameters('logAnalytics')]"
      }
    }
  },
  {
    "policyDefinitionReferenceId": "DeployDiagnosticsAPIMgmt",
    "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-APIMgmt",
    "parameters": {
      "logAnalytics": {
        "value": "[parameters('logAnalytics')]"
      }
    }
  },
  {
    "policyDefinitionReferenceId": "DeployDiagnosticsApplicationGateway",
    "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-ApplicationGateway",
    "parameters": {
      "logAnalytics": {
        "value": "[parameters('logAnalytics')]"
      }
    }
  },
  {
    "policyDefinitionReferenceId": "DeployDiagnosticsBatch",
    "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-Batch",
    "parameters": {
      "logAnalytics": {
        "value": "[parameters('logAnalytics')]"
      }
    }
  },
  {
    "policyDefinitionReferenceId": "DeployDiagnosticsMySQL",
    "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-MySQL",
    "parameters": {
      "logAnalytics": {
        "value": "[parameters('logAnalytics')]"
      }
    }
  },
  {
    "policyDefinitionReferenceId": "DeployDiagnosticsPostgreSQL",
    "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-PostgreSQL",
    "parameters": {
      "logAnalytics": {
        "value": "[parameters('logAnalytics')]"
      }
    }
  },
  {
    "policyDefinitionReferenceId": "DeployDiagnosticsCDNEndpoints",
    "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-CDNEndpoints",
    "parameters": {
      "logAnalytics": {
        "value": "[parameters('logAnalytics')]"
      }
    }
  },
  {
    "policyDefinitionReferenceId": "DeployDiagnosticsCosmosDB",
    "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-CosmosDB",
    "parameters": {
      "logAnalytics": {
        "value": "[parameters('logAnalytics')]"
      }
    }
  },
  {
    "policyDefinitionReferenceId": "DeployDiagnosticsDataFactory",
    "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-DataFactory",
    "parameters": {
      "logAnalytics": {
        "value": "[parameters('logAnalytics')]"
      }
    }
  },
  {
    "policyDefinitionReferenceId": "DeployDiagnosticsFirewall",
    "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-Firewall",
    "parameters": {
      "logAnalytics": {
        "value": "[parameters('logAnalytics')]"
      }
    }
  },
  {
    "policyDefinitionReferenceId": "DeployDiagnosticsPowerBIEmbedded",
    "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-PowerBIEmbedded",
    "parameters": {
      "logAnalytics": {
        "value": "[parameters('logAnalytics')]"
      }
    }
  },
  {
    "policyDefinitionReferenceId": "DeployDiagnosticsStreamAnalytics",
    "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-StreamAnalytics",
    "parameters": {
      "logAnalytics": {
        "value": "[parameters('logAnalytics')]"
      }
    }
  },
  {
    "policyDefinitionReferenceId": "DeployDiagnosticsExpressRoute",
    "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-ExpressRoute",
    "parameters": {
      "logAnalytics": {
        "value": "[parameters('logAnalytics')]"
      }
    }
  },
  {
    "policyDefinitionReferenceId": "DeployDiagnosticsACI",
    "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-ACI",
    "parameters": {
      "logAnalytics": {
        "value": "[parameters('logAnalytics')]"
      }
    }
  },
  {
    "policyDefinitionReferenceId": "DeployDiagnosticsACR",
    "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-ACR",
    "parameters": {
      "logAnalytics": {
        "value": "[parameters('logAnalytics')]"
      }
    }
  },
  {
    "policyDefinitionReferenceId": "DeployDiagnosticsVirtualNetwork",
    "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-VirtualNetwork",
    "parameters": {
      "logAnalytics": {
        "value": "[parameters('logAnalytics')]"
      }
    }
  },
  {
    "policyDefinitionReferenceId": "DeployDiagnosticsVM",
    "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-VM",
    "parameters": {
      "logAnalytics": {
        "value": "[parameters('logAnalytics')]"
      }
    }
  },
  {
    "policyDefinitionReferenceId": "DeployDiagnosticsVMSS",
    "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-VMSS",
    "parameters": {
      "logAnalytics": {
        "value": "[parameters('logAnalytics')]"
      }
    }
  },
  {
    "policyDefinitionReferenceId": "DeployDiagnosticsVNetGW",
    "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-VNetGW",
    "parameters": {
      "logAnalytics": {
        "value": "[parameters('logAnalytics')]"
      }
    }
  },
  {
    "policyDefinitionReferenceId": "DeployDiagnosticsAKS",
    "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-AKS",
    "parameters": {
      "logAnalytics": {
        "value": "[parameters('logAnalytics')]"
      }
    }
  },
  {
    "policyDefinitionReferenceId": "DeployDiagnosticsWebsite",
    "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-Website",
    "parameters": {
      "logAnalytics": {
        "value": "[parameters('logAnalytics')]"
      }
    }
  },
  {
    "policyDefinitionReferenceId": "DeployDiagnosticsAnalysisService",
    "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-AnalysisService",
    "parameters": {
      "logAnalytics": {
        "value": "[parameters('logAnalytics')]"
      }
    }
  },
  {
    "policyDefinitionReferenceId": "DeployDiagnosticsEventGridTopic",
    "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-EventGridTopic",
    "parameters": {
      "logAnalytics": {
        "value": "[parameters('logAnalytics')]"
      }
    }
  },
  {
    "policyDefinitionReferenceId": "DeployDiagnosticsEventGridSub",
    "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-EventGridSub",
    "parameters": {
      "logAnalytics": {
        "value": "[parameters('logAnalytics')]"
      }
    }
  },
  {
    "policyDefinitionReferenceId": "DeployDiagnosticsHDInsight",
    "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-HDInsight",
    "parameters": {
      "logAnalytics": {
        "value": "[parameters('logAnalytics')]"
      }
    }
  },
  {
    "policyDefinitionReferenceId": "DeployDiagnosticsRedisCache",
    "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-RedisCache",
    "parameters": {
      "logAnalytics": {
        "value": "[parameters('logAnalytics')]"
      }
    }
  },
  {
    "policyDefinitionReferenceId": "DeployDiagnosticsRelay",
    "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-Relay",
    "parameters": {
      "logAnalytics": {
        "value": "[parameters('logAnalytics')]"
      }
    }
  },
  {
    "policyDefinitionReferenceId": "DeployDiagnosticsSignalR",
    "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-SignalR",
    "parameters": {
      "logAnalytics": {
        "value": "[parameters('logAnalytics')]"
      }
    }
  },
  {
    "policyDefinitionReferenceId": "DeployDiagnosticsTrafficManager",
    "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-TrafficManager",
    "parameters": {
      "logAnalytics": {
        "value": "[parameters('logAnalytics')]"
      }
    }
  },
  {
    "policyDefinitionReferenceId": "DeployDiagnosticsWebServerFarm",
    "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-WebServerFarm",
    "parameters": {
      "logAnalytics": {
        "value": "[parameters('logAnalytics')]"
      }
    }
  },
  {
    "policyDefinitionReferenceId": "DeployDiagnosticsSQLMI",
    "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-SQLMI",
    "parameters": {
      "logAnalytics": {
        "value": "[parameters('logAnalytics')]"
      }
    }
  },
  {
    "policyDefinitionReferenceId": "DeployDiagnosticsTimeSeriesInsights",
    "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-TimeSeriesInsights",
    "parameters": {
      "logAnalytics": {
        "value": "[parameters('logAnalytics')]"
      }
    }
  },
  {
    "policyDefinitionReferenceId": "DeployDiagnosticsMlWorkspace",
    "policyDefinitionId": "/providers/Microsoft.Management/managementgroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-MlWorkspace",
    "parameters": {
      "logAnalytics": {
        "value": "[parameters('logAnalytics')]"
      }
    }
  }
]
POLICYDEFINITIONS
  parameters         = <<PARAMETERS
{
  "logAnalytics": {
    "type": "String",
    "metadata": {
      "displayName": "Log Analytics workspace",
      "description": "Select the Log Analytics workspace from dropdown list",
      "strongType": "omsWorkspace"
    }
  }
}
PARAMETERS
}

output "policysetdefinition_deploy_diag_loganalytics" {
  value = azurerm_policy_set_definition.deploy_diag_loganalytics
}


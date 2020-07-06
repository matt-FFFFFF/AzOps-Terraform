# This fine was auto generated
resource "azurerm_policy_set_definition" "deploy_diag_loganalytics" {
  name                = "Deploy-Diag-LogAnalytics"
  policy_type         = "Custom"
  display_name        = "Deploy-Diag-LogAnalytics"
  description         = "This initiative configures application Azure resources to forward diagnostic logs and metrics to an Azure Log Analytics workspace."
  management_group_id = var.management_group_name
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
{
  "policyDefinitionReferenceId": "Deploy-Diagnostics-NIC",
  "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/ES-mawhi/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-NIC",
  "parameters": {
    "logAnalytics": {
      "value": "[parameters('logAnalytics')]"
    }
  }
}
{
  "policyDefinitionReferenceId": "Deploy-Diagnostics-AA",
  "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/ES-mawhi/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-AA",
  "parameters": {
    "logAnalytics": {
      "value": "[parameters('logAnalytics')]"
    }
  }
}
{
  "policyDefinitionReferenceId": "Deploy-Diagnostics-PublicIP",
  "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/ES-mawhi/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-PublicIP",
  "parameters": {
    "logAnalytics": {
      "value": "[parameters('logAnalytics')]"
    }
  }
}
{
  "policyDefinitionReferenceId": "Deploy-Diagnostics-LoadBalancer",
  "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/ES-mawhi/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-LoadBalancer",
  "parameters": {
    "logAnalytics": {
      "value": "[parameters('logAnalytics')]"
    }
  }
}
{
  "policyDefinitionReferenceId": "Deploy-Diagnostics-NetworkSecurityGroups",
  "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/ES-mawhi/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-NetworkSecurityGroups",
  "parameters": {
    "logAnalytics": {
      "value": "[parameters('logAnalytics')]"
    }
  }
}
{
  "policyDefinitionReferenceId": "Deploy-Diagnostics-KeyVault",
  "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/ES-mawhi/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-KeyVault",
  "parameters": {
    "logAnalytics": {
      "value": "[parameters('logAnalytics')]"
    }
  }
}
{
  "policyDefinitionReferenceId": "Deploy-Diagnostics-CognitiveServices",
  "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/ES-mawhi/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-CognitiveServices",
  "parameters": {
    "logAnalytics": {
      "value": "[parameters('logAnalytics')]"
    }
  }
}
{
  "policyDefinitionReferenceId": "Deploy-Diagnostics-DLAnalytics",
  "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/ES-mawhi/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-DLAnalytics",
  "parameters": {
    "logAnalytics": {
      "value": "[parameters('logAnalytics')]"
    }
  }
}
{
  "policyDefinitionReferenceId": "Deploy-Diagnostics-DataLakeStore",
  "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/ES-mawhi/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-DataLakeStore",
  "parameters": {
    "logAnalytics": {
      "value": "[parameters('logAnalytics')]"
    }
  }
}
{
  "policyDefinitionReferenceId": "Deploy-Diagnostics-EventHub",
  "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/ES-mawhi/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-EventHub",
  "parameters": {
    "logAnalytics": {
      "value": "[parameters('logAnalytics')]"
    }
  }
}
{
  "policyDefinitionReferenceId": "Deploy-Diagnostics-iotHub",
  "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/ES-mawhi/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-iotHub",
  "parameters": {
    "logAnalytics": {
      "value": "[parameters('logAnalytics')]"
    }
  }
}
{
  "policyDefinitionReferenceId": "Deploy-Diagnostics-LogicAppsWF",
  "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/ES-mawhi/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-LogicAppsWF",
  "parameters": {
    "logAnalytics": {
      "value": "[parameters('logAnalytics')]"
    }
  }
}
{
  "policyDefinitionReferenceId": "Deploy-Diagnostics-LogicAppsISE",
  "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/ES-mawhi/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-LogicAppsISE",
  "parameters": {
    "logAnalytics": {
      "value": "[parameters('logAnalytics')]"
    }
  }
}
{
  "policyDefinitionReferenceId": "Deploy-Diagnostics-RecoveryVault",
  "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/ES-mawhi/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-RecoveryVault",
  "parameters": {
    "logAnalytics": {
      "value": "[parameters('logAnalytics')]"
    }
  }
}
{
  "policyDefinitionReferenceId": "Deploy-Diagnostics-SearchServices",
  "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/ES-mawhi/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-SearchServices",
  "parameters": {
    "logAnalytics": {
      "value": "[parameters('logAnalytics')]"
    }
  }
}
{
  "policyDefinitionReferenceId": "Deploy-Diagnostics-ServiceBus",
  "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/ES-mawhi/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-ServiceBus",
  "parameters": {
    "logAnalytics": {
      "value": "[parameters('logAnalytics')]"
    }
  }
}
{
  "policyDefinitionReferenceId": "Deploy-Diagnostics-SQLDBs",
  "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/ES-mawhi/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-SQLDBs",
  "parameters": {
    "logAnalytics": {
      "value": "[parameters('logAnalytics')]"
    }
  }
}
{
  "policyDefinitionReferenceId": "Deploy-Diagnostics-SQLElasticPools",
  "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/ES-mawhi/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-SQLElasticPools",
  "parameters": {
    "logAnalytics": {
      "value": "[parameters('logAnalytics')]"
    }
  }
}
{
  "policyDefinitionReferenceId": "Deploy-Diagnostics-APIMgmt",
  "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/ES-mawhi/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-APIMgmt",
  "parameters": {
    "logAnalytics": {
      "value": "[parameters('logAnalytics')]"
    }
  }
}
{
  "policyDefinitionReferenceId": "Deploy-Diagnostics-ApplicationGateway",
  "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/ES-mawhi/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-ApplicationGateway",
  "parameters": {
    "logAnalytics": {
      "value": "[parameters('logAnalytics')]"
    }
  }
}
{
  "policyDefinitionReferenceId": "Deploy-Diagnostics-Batch",
  "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/ES-mawhi/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-Batch",
  "parameters": {
    "logAnalytics": {
      "value": "[parameters('logAnalytics')]"
    }
  }
}
{
  "policyDefinitionReferenceId": "Deploy-Diagnostics-MySQL",
  "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/ES-mawhi/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-MySQL",
  "parameters": {
    "logAnalytics": {
      "value": "[parameters('logAnalytics')]"
    }
  }
}
{
  "policyDefinitionReferenceId": "Deploy-Diagnostics-PostgreSQL",
  "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/ES-mawhi/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-PostgreSQL",
  "parameters": {
    "logAnalytics": {
      "value": "[parameters('logAnalytics')]"
    }
  }
}
{
  "policyDefinitionReferenceId": "Deploy-Diagnostics-CDNEndpoints",
  "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/ES-mawhi/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-CDNEndpoints",
  "parameters": {
    "logAnalytics": {
      "value": "[parameters('logAnalytics')]"
    }
  }
}
{
  "policyDefinitionReferenceId": "Deploy-Diagnostics-CosmosDB",
  "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/ES-mawhi/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-CosmosDB",
  "parameters": {
    "logAnalytics": {
      "value": "[parameters('logAnalytics')]"
    }
  }
}
{
  "policyDefinitionReferenceId": "Deploy-Diagnostics-DataFactory",
  "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/ES-mawhi/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-DataFactory",
  "parameters": {
    "logAnalytics": {
      "value": "[parameters('logAnalytics')]"
    }
  }
}
{
  "policyDefinitionReferenceId": "Deploy-Diagnostics-Firewall",
  "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/ES-mawhi/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-Firewall",
  "parameters": {
    "logAnalytics": {
      "value": "[parameters('logAnalytics')]"
    }
  }
}
{
  "policyDefinitionReferenceId": "Deploy-Diagnostics-PowerBIEmbedded",
  "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/ES-mawhi/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-PowerBIEmbedded",
  "parameters": {
    "logAnalytics": {
      "value": "[parameters('logAnalytics')]"
    }
  }
}
{
  "policyDefinitionReferenceId": "Deploy-Diagnostics-StreamAnalytics",
  "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/ES-mawhi/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-StreamAnalytics",
  "parameters": {
    "logAnalytics": {
      "value": "[parameters('logAnalytics')]"
    }
  }
}
{
  "policyDefinitionReferenceId": "Deploy-Diagnostics-ExpressRoute",
  "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/ES-mawhi/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-ExpressRoute",
  "parameters": {
    "logAnalytics": {
      "value": "[parameters('logAnalytics')]"
    }
  }
}
{
  "policyDefinitionReferenceId": "Deploy-Diagnostics-ACI",
  "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/ES-mawhi/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-ACI",
  "parameters": {
    "logAnalytics": {
      "value": "[parameters('logAnalytics')]"
    }
  }
}
{
  "policyDefinitionReferenceId": "Deploy-Diagnostics-ACR",
  "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/ES-mawhi/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-ACR",
  "parameters": {
    "logAnalytics": {
      "value": "[parameters('logAnalytics')]"
    }
  }
}
{
  "policyDefinitionReferenceId": "Deploy-Diagnostics-VirtualNetwork",
  "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/ES-mawhi/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-VirtualNetwork",
  "parameters": {
    "logAnalytics": {
      "value": "[parameters('logAnalytics')]"
    }
  }
}
{
  "policyDefinitionReferenceId": "Deploy-Diagnostics-VM",
  "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/ES-mawhi/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-VM",
  "parameters": {
    "logAnalytics": {
      "value": "[parameters('logAnalytics')]"
    }
  }
}
{
  "policyDefinitionReferenceId": "Deploy-Diagnostics-VMSS",
  "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/ES-mawhi/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-VMSS",
  "parameters": {
    "logAnalytics": {
      "value": "[parameters('logAnalytics')]"
    }
  }
}
{
  "policyDefinitionReferenceId": "Deploy-Diagnostics-VNetGW",
  "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/ES-mawhi/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-VNetGW",
  "parameters": {
    "logAnalytics": {
      "value": "[parameters('logAnalytics')]"
    }
  }
}
{
  "policyDefinitionReferenceId": "Deploy-Diagnostics-AKS",
  "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/ES-mawhi/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-AKS",
  "parameters": {
    "logAnalytics": {
      "value": "[parameters('logAnalytics')]"
    }
  }
}
{
  "policyDefinitionReferenceId": "Deploy-Diagnostics-Website",
  "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/ES-mawhi/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-Website",
  "parameters": {
    "logAnalytics": {
      "value": "[parameters('logAnalytics')]"
    }
  }
}
{
  "policyDefinitionReferenceId": "Deploy-Diagnostics-AnalysisService",
  "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/ES-mawhi/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-AnalysisService",
  "parameters": {
    "logAnalytics": {
      "value": "[parameters('logAnalytics')]"
    }
  }
}
{
  "policyDefinitionReferenceId": "Deploy-Diagnostics-EventGridTopic",
  "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/ES-mawhi/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-EventGridTopic",
  "parameters": {
    "logAnalytics": {
      "value": "[parameters('logAnalytics')]"
    }
  }
}
{
  "policyDefinitionReferenceId": "Deploy-Diagnostics-EventGridSub",
  "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/ES-mawhi/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-EventGridSub",
  "parameters": {
    "logAnalytics": {
      "value": "[parameters('logAnalytics')]"
    }
  }
}
{
  "policyDefinitionReferenceId": "Deploy-Diagnostics-HDInsight",
  "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/ES-mawhi/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-HDInsight",
  "parameters": {
    "logAnalytics": {
      "value": "[parameters('logAnalytics')]"
    }
  }
}
{
  "policyDefinitionReferenceId": "Deploy-Diagnostics-RedisCache",
  "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/ES-mawhi/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-RedisCache",
  "parameters": {
    "logAnalytics": {
      "value": "[parameters('logAnalytics')]"
    }
  }
}
{
  "policyDefinitionReferenceId": "Deploy-Diagnostics-Relay",
  "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/ES-mawhi/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-Relay",
  "parameters": {
    "logAnalytics": {
      "value": "[parameters('logAnalytics')]"
    }
  }
}
{
  "policyDefinitionReferenceId": "Deploy-Diagnostics-SignalR",
  "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/ES-mawhi/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-SignalR",
  "parameters": {
    "logAnalytics": {
      "value": "[parameters('logAnalytics')]"
    }
  }
}
{
  "policyDefinitionReferenceId": "Deploy-Diagnostics-TrafficManager",
  "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/ES-mawhi/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-TrafficManager",
  "parameters": {
    "logAnalytics": {
      "value": "[parameters('logAnalytics')]"
    }
  }
}
{
  "policyDefinitionReferenceId": "Deploy-Diagnostics-WebServerFarm",
  "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/ES-mawhi/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-WebServerFarm",
  "parameters": {
    "logAnalytics": {
      "value": "[parameters('logAnalytics')]"
    }
  }
}
{
  "policyDefinitionReferenceId": "Deploy-Diagnostics-SQLMI",
  "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/ES-mawhi/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-SQLMI",
  "parameters": {
    "logAnalytics": {
      "value": "[parameters('logAnalytics')]"
    }
  }
}
{
  "policyDefinitionReferenceId": "Deploy-Diagnostics-TimeSeriesInsights",
  "policyDefinitionId": "/providers/Microsoft.Management/managementGroups/ES-mawhi/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-TimeSeriesInsights",
  "parameters": {
    "logAnalytics": {
      "value": "[parameters('logAnalytics')]"
    }
  }
}
{
  "policyDefinitionReferenceId": "Deploy-Diagnostics-MlWorkspace",
  "policyDefinitionId": "/providers/Microsoft.Management/managementgroups/ES-mawhi/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-MlWorkspace",
  "parameters": {
    "logAnalytics": {
      "value": "[parameters('logAnalytics')]"
    }
  }
}
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


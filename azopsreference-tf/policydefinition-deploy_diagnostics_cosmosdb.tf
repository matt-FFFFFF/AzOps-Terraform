resource "azurerm_policy_definition" "deploy_diagnostics_cosmosdb" {
  name                  = "Deploy-Diagnostics-CosmosDB"
  policy_type           = "Custom"
  mode                  = "All"
  display_name          = "Deploy-Diagnostics-CosmosDB"
  description           = "Apply diagnostic settings for Cosmos DB - Log Analytics"

  management_group_name = azurerm_management_group.es.name
  policy_rule           = var.policydefinition_deploy_diagnostics_cosmosdb_policyrule
  policy_parameters     = var.policyDefinition-deploy_diagnostics_cosmosdb-parameters
}

variable "policydefinition_deploy_diagnostics_cosmosdb_policyrule" {
    type = string
}

variable "policydefinition_deploy_diagnostics_cosmosdb_parameters" {
    type    = string
    default = ""
}

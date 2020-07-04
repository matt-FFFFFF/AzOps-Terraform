resource "azurerm_policy_definition" "deploy_diagnostics_sqlelasticpools" {
  name                  = "Deploy-Diagnostics-SQLElasticPools"
  policy_type           = "Custom"
  mode                  = "All"
  display_name          = "Deploy-Diagnostics-SQLElasticPools"
  description           = "Apply diagnostic settings for SQL Elastic Pools - Log Analytics"

  management_group_name = azurerm_management_group.es.name
  policy_rule           = var.policydefinition_deploy_diagnostics_sqlelasticpools_policyrule
  parameters            = var.policydefinition_deploy_diagnostics_sqlelasticpools_parameters
}

variable "policydefinition_deploy_diagnostics_sqlelasticpools_policyrule" {
    type = string
}

variable "policydefinition_deploy_diagnostics_sqlelasticpools_parameters" {
    type    = string
    default = ""
}

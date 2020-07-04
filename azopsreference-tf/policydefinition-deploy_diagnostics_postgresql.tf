resource "azurerm_policy_definition" "deploy_diagnostics_postgresql" {
  name                  = "Deploy-Diagnostics-PostgreSQL"
  policy_type           = "Custom"
  mode                  = "All"
  display_name          = "Deploy-Diagnostics-PostgreSQL"
  description           = "Apply diagnostic settings for PostgreSQL Databases - Log Analytics"

  management_group_name = azurerm_management_group.es.name
  policy_rule           = var.policydefinition_deploy_diagnostics_postgresql_policyrule
  policy_parameters     = var.policyDefinition-deploy_diagnostics_postgresql-parameters
}

variable "policydefinition_deploy_diagnostics_postgresql_policyrule" {
    type = string
}

variable "policydefinition_deploy_diagnostics_postgresql_parameters" {
    type    = string
    default = ""
}

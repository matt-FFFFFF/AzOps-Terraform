resource "azurerm_policy_definition" "deploy_diagnostics_sqldbs" {
  name         = "Deploy-Diagnostics-SQLDBs"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Deploy-Diagnostics-SQLDBs"
  description  = "Apply diagnostic settings for SQL Databases - Log Analytics"

  management_group_name = azurerm_management_group.es.name
  policy_rule           = var.policydefinition_deploy_diagnostics_sqldbs_policyrule
  parameters            = var.policydefinition_deploy_diagnostics_sqldbs_parameters
}

variable "policydefinition_deploy_diagnostics_sqldbs_policyrule" {
  type = string
}

variable "policydefinition_deploy_diagnostics_sqldbs_parameters" {
  type    = string
  default = ""
}

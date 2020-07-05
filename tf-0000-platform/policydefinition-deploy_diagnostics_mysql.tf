resource "azurerm_policy_definition" "deploy_diagnostics_mysql" {
  name                  = "Deploy-Diagnostics-MySQL"
  policy_type           = "Custom"
  mode                  = "All"
  display_name          = "Deploy-Diagnostics-MySQL"
  description           = "Apply diagnostic settings for MySQL Databases - Log Analytics"

  management_group_name = azurerm_management_group.es.name
  policy_rule           = var.policydefinition_deploy_diagnostics_mysql_policyrule
  parameters            = var.policydefinition_deploy_diagnostics_mysql_parameters
}

variable "policydefinition_deploy_diagnostics_mysql_policyrule" {
    type = string
}

variable "policydefinition_deploy_diagnostics_mysql_parameters" {
    type    = string
    default = ""
}

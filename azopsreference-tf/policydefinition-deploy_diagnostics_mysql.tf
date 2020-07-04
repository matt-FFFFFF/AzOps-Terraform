resource "azurerm_policy_definition" "deploy_diagnostics_mysql" {
  name                  = "Deploy-Diagnostics-MySQL"
  policy_type           = "Custom"
  mode                  = "All"
  display_name          = "Deploy-Diagnostics-MySQL"
  description           = "Apply diagnostic settings for MySQL Databases - Log Analytics"

  management_group_name = azurerm_management_group.<changeme>.name
  policy_rule           = var.policyDefinition_deploy_diagnostics_mysql_policyrule
  policy_parameters     = var.policyDefinition-deploy_diagnostics_mysql-parameters
}


variable "policyDefinition_deploy_diagnostics_mysql_policyrule" {
    type = string
}

variable "policyDefinition_deploy_diagnostics_mysql_parameters" {
    type    = string
    default = ""
}

resource "azurerm_policy_definition" "deploy_sql_auditingsettings" {
  name                  = "Deploy-Sql-AuditingSettings"
  policy_type           = "Custom"
  mode                  = "All"
  display_name          = "Deploy-Sql-AuditingSettings"
  description           = "Configures SQL Server"

  management_group_name = azurerm_management_group.<changeme>.name
  policy_rule           = var.policyDefinition_deploy_sql_auditingsettings_policyrule
  
}


variable "policyDefinition_deploy_sql_auditingsettings_policyrule" {
    type = string
}

variable "policyDefinition_deploy_sql_auditingsettings_parameters" {
    type    = string
    default = ""
}

resource "azurerm_policy_definition" "deploy_sql_tde" {
  name                  = "Deploy-Sql-Tde"
  policy_type           = "Custom"
  mode                  = "All"
  display_name          = "Deploy-Sql-Tde"
  description           = "Configures SQL DataBases"

  management_group_name = azurerm_management_group.es.name
  policy_rule           = var.policydefinition_deploy_sql_tde_policyrule
  
}

variable "policydefinition_deploy_sql_tde_policyrule" {
    type = string
}

variable "policydefinition_deploy_sql_tde_parameters" {
    type    = string
    default = ""
}

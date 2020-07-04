resource "azurerm_policy_definition" "deploy_sql_tde" {
  name                  = "Deploy-Sql-Tde"
  policy_type           = "Custom"
  mode                  = "All"
  display_name          = "Deploy-Sql-Tde"
  description           = "Configures SQL DataBases"

  management_group_name = azurerm_management_group.<changeme>.name
  policy_rule           = var.policyDefinition_deploy_sql_tde_policyrule
  
}


variable "policyDefinition_deploy_sql_tde_policyrule" {
    type = string
}

variable "policyDefinition_deploy_sql_tde_parameters" {
    type    = string
    default = ""
}

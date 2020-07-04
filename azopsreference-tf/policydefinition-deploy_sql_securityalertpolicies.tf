resource "azurerm_policy_definition" "deploy_sql_securityalertpolicies" {
  name                  = "Deploy-Sql-SecurityAlertPolicies"
  policy_type           = "Custom"
  mode                  = "All"
  display_name          = "Deploy-Sql-SecurityAlertPolicies"
  description           = "Configures SQL DataBases"

  management_group_name = azurerm_management_group.es.name
  policy_rule           = var.policydefinition_deploy_sql_securityalertpolicies_policyrule
  
}

variable "policydefinition_deploy_sql_securityalertpolicies_policyrule" {
    type = string
}

variable "policydefinition_deploy_sql_securityalertpolicies_parameters" {
    type    = string
    default = ""
}

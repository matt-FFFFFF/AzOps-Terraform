resource "azurerm_policy_set_definition" "deploy_sql_security" {
  name               = "Deploy-Sql-Security"
  policy_type        = "Custom"
  display_name       = "Deploy-Sql-Security"
  description        = "Recommended built-in security policies for the North Star architecture"
  policy_definitions = var.policysetdefinition_deploy_sql_security_policydefinitions
  parameters         = var.policysetdefinition_deploy_sql_security_parameters
}

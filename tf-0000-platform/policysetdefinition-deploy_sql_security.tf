resource "azurerm_policy_set_definition" "deploy_sql_security" {
  name                = "Deploy-Sql-Security"
  policy_type         = "Custom"
  display_name        = "Deploy-Sql-Security"
  description         = "Recommended built-in security policies for the North Star architecture"
  management_group_id = azurerm_management_group.es.name
  depends_on = [
    azurerm_policy_definition.deploy_sql_auditingsettings,
    azurerm_policy_definition.deploy_sql_securityalertpolicies,
    azurerm_policy_definition.deploy_sql_tde,
    azurerm_policy_definition.deploy_sql_vulnerabilityassessments,
  ]
  policy_definitions = var.policysetdefinition_deploy_sql_security_policydefinitions
  parameters         = var.policysetdefinition_deploy_sql_security_parameters
}

variable "policysetdefinition_deploy_sql_security_policydefinitions" {
  type = string
}

variable "policysetdefinition_deploy_sql_security_parameters" {
  type    = string
  default = ""
}

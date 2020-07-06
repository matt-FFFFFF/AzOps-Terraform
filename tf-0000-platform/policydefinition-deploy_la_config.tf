resource "azurerm_policy_definition" "deploy_la_config" {
  name         = "Deploy-LA-Config"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Deploy-LA-Config"
  description  = "null"

  management_group_name = azurerm_management_group.es.name
  policy_rule           = var.policydefinition_deploy_la_config_policyrule
  parameters            = var.policydefinition_deploy_la_config_parameters
}

variable "policydefinition_deploy_la_config_policyrule" {
  type = string
}

variable "policydefinition_deploy_la_config_parameters" {
  type    = string
  default = ""
}

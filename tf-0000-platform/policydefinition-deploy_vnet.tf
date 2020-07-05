resource "azurerm_policy_definition" "deploy_vnet" {
  name         = "Deploy-vNet"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Deploy-vNet"
  description  = "Deploy-vNet"

  management_group_name = azurerm_management_group.es.name
  policy_rule           = var.policydefinition_deploy_vnet_policyrule
  parameters            = var.policydefinition_deploy_vnet_parameters
}

variable "policydefinition_deploy_vnet_policyrule" {
  type = string
}

variable "policydefinition_deploy_vnet_parameters" {
  type    = string
  default = ""
}

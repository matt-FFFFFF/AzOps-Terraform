resource "azurerm_policy_definition" "deploy_vwan" {
  name         = "Deploy-vWAN"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Deploy-vWAN"
  description  = "null"

  management_group_name = azurerm_management_group.es.name
  policy_rule           = var.policydefinition_deploy_vwan_policyrule
  parameters            = var.policydefinition_deploy_vwan_parameters
}

variable "policydefinition_deploy_vwan_policyrule" {
  type = string
}

variable "policydefinition_deploy_vwan_parameters" {
  type    = string
  default = ""
}

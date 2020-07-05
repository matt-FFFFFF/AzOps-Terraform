resource "azurerm_policy_definition" "deploy_vhub" {
  name         = "Deploy-vHUB"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Deploy-vHUB"
  description  = "Deploys Azure Virtual WAN vHUB in desired regions"

  management_group_name = azurerm_management_group.es.name
  policy_rule           = var.policydefinition_deploy_vhub_policyrule
  parameters            = var.policydefinition_deploy_vhub_parameters
}

variable "policydefinition_deploy_vhub_policyrule" {
  type = string
}

variable "policydefinition_deploy_vhub_parameters" {
  type    = string
  default = ""
}

resource "azurerm_policy_definition" "deploy_ddosprotection" {
  name                  = "Deploy-DDoSProtection"
  policy_type           = "Custom"
  mode                  = "All"
  display_name          = "Deploy-DDoSProtection"
  description           = "This policy deploys an Azure DDoS Protection Standard plan"

  management_group_name = azurerm_management_group.es.name
  policy_rule           = var.policydefinition_deploy_ddosprotection_policyrule
  parameters            = var.policydefinition_deploy_ddosprotection_parameters
}

variable "policydefinition_deploy_ddosprotection_policyrule" {
    type = string
}

variable "policydefinition_deploy_ddosprotection_parameters" {
    type    = string
    default = ""
}

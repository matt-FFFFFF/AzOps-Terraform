resource "azurerm_policy_definition" "deploy_ddosprotection" {
  name                  = "Deploy-DDoSProtection"
  policy_type           = "Custom"
  mode                  = "All"
  display_name          = "Deploy-DDoSProtection"
  description           = "This policy deploys an Azure DDoS Protection Standard plan"

  management_group_name = azurerm_management_group.<changeme>.name
  policy_rule           = var.policyDefinition_deploy_ddosprotection_policyrule
  policy_parameters     = var.policyDefinition-deploy_ddosprotection-parameters
}


variable "policyDefinition_deploy_ddosprotection_policyrule" {
    type = string
}

variable "policyDefinition_deploy_ddosprotection_parameters" {
    type    = string
    default = ""
}

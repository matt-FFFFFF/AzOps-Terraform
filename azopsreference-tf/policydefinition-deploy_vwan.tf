resource "azurerm_policy_definition" "deploy_vwan" {
  name                  = "Deploy-vWAN"
  policy_type           = "Custom"
  mode                  = "All"
  display_name          = "Deploy-vWAN"
  description           = "null"

  management_group_name = azurerm_management_group.<changeme>.name
  policy_rule           = var.policyDefinition_deploy_vwan_policyrule
  policy_parameters     = var.policyDefinition-deploy_vwan-parameters
}


variable "policyDefinition_deploy_vwan_policyrule" {
    type = string
}

variable "policyDefinition_deploy_vwan_parameters" {
    type    = string
    default = ""
}

resource "azurerm_policy_definition" "deploy_vhub" {
  name                  = "Deploy-vHUB"
  policy_type           = "Custom"
  mode                  = "All"
  display_name          = "Deploy-vHUB"
  description           = "Deploys Azure Virtual WAN vHUB in desired regions"

  management_group_name = azurerm_management_group.<changeme>.name
  policy_rule           = var.policyDefinition_deploy_vhub_policyrule
  policy_parameters     = var.policyDefinition-deploy_vhub-parameters
}


variable "policyDefinition_deploy_vhub_policyrule" {
    type = string
}

variable "policyDefinition_deploy_vhub_parameters" {
    type    = string
    default = ""
}

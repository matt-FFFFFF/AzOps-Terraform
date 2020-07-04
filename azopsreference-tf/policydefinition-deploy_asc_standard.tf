resource "azurerm_policy_definition" "deploy_asc_standard" {
  name                  = "Deploy-ASC-Standard"
  policy_type           = "Custom"
  mode                  = "All"
  display_name          = "Deploy-ASC-Standard"
  description           = "Ensures that subscriptions have Security Centre Standard enabled."

  management_group_name = azurerm_management_group.<changeme>.name
  policy_rule           = var.policyDefinition_deploy_asc_standard_policyrule
  policy_parameters     = var.policyDefinition-deploy_asc_standard-parameters
}


variable "policyDefinition_deploy_asc_standard_policyrule" {
    type = string
}

variable "policyDefinition_deploy_asc_standard_parameters" {
    type    = string
    default = ""
}

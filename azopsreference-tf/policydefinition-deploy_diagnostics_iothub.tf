resource "azurerm_policy_definition" "deploy_diagnostics_iothub" {
  name                  = "Deploy-Diagnostics-iotHub"
  policy_type           = "Custom"
  mode                  = "All"
  display_name          = "Deploy-Diagnostics-iotHub"
  description           = "Apply diagnostic settings for IoT Hubs - Log Analytics"

  management_group_name = azurerm_management_group.<changeme>.name
  policy_rule           = var.policyDefinition_deploy_diagnostics_iothub_policyrule
  policy_parameters     = var.policyDefinition-deploy_diagnostics_iothub-parameters
}


variable "policyDefinition_deploy_diagnostics_iothub_policyrule" {
    type = string
}

variable "policyDefinition_deploy_diagnostics_iothub_parameters" {
    type    = string
    default = ""
}

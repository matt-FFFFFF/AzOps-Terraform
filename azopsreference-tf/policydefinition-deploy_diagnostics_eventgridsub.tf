resource "azurerm_policy_definition" "deploy_diagnostics_eventgridsub" {
  name                  = "Deploy-Diagnostics-EventGridSub"
  policy_type           = "Custom"
  mode                  = "All"
  display_name          = "Deploy-Diagnostics-EventGridSub"
  description           = "Apply diagnostic settings for Event Grid Subscriptions - Log Analytics"

  management_group_name = azurerm_management_group.<changeme>.name
  policy_rule           = var.policyDefinition_deploy_diagnostics_eventgridsub_policyrule
  policy_parameters     = var.policyDefinition-deploy_diagnostics_eventgridsub-parameters
}


variable "policyDefinition_deploy_diagnostics_eventgridsub_policyrule" {
    type = string
}

variable "policyDefinition_deploy_diagnostics_eventgridsub_parameters" {
    type    = string
    default = ""
}

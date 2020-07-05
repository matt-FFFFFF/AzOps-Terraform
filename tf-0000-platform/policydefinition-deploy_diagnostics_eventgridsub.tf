resource "azurerm_policy_definition" "deploy_diagnostics_eventgridsub" {
  name         = "Deploy-Diagnostics-EventGridSub"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Deploy-Diagnostics-EventGridSub"
  description  = "Apply diagnostic settings for Event Grid Subscriptions - Log Analytics"

  management_group_name = azurerm_management_group.es.name
  policy_rule           = var.policydefinition_deploy_diagnostics_eventgridsub_policyrule
  parameters            = var.policydefinition_deploy_diagnostics_eventgridsub_parameters
}

variable "policydefinition_deploy_diagnostics_eventgridsub_policyrule" {
  type = string
}

variable "policydefinition_deploy_diagnostics_eventgridsub_parameters" {
  type    = string
  default = ""
}

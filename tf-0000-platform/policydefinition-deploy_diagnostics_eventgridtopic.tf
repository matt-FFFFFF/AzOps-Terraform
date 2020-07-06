resource "azurerm_policy_definition" "deploy_diagnostics_eventgridtopic" {
  name         = "Deploy-Diagnostics-EventGridTopic"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Deploy-Diagnostics-EventGridTopic"
  description  = "Apply diagnostic settings for Event Grid Topics - Log Analytics"

  management_group_name = azurerm_management_group.es.name
  policy_rule           = var.policydefinition_deploy_diagnostics_eventgridtopic_policyrule
  parameters            = var.policydefinition_deploy_diagnostics_eventgridtopic_parameters
}

variable "policydefinition_deploy_diagnostics_eventgridtopic_policyrule" {
  type = string
}

variable "policydefinition_deploy_diagnostics_eventgridtopic_parameters" {
  type    = string
  default = ""
}

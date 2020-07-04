resource "azurerm_policy_definition" "deploy_diagnostics_eventgridtopic" {
  name                  = "Deploy-Diagnostics-EventGridTopic"
  policy_type           = "Custom"
  mode                  = "All"
  display_name          = "Deploy-Diagnostics-EventGridTopic"
  description           = "Apply diagnostic settings for Event Grid Topics - Log Analytics"

  management_group_name = azurerm_management_group.<changeme>.name
  policy_rule           = var.policyDefinition_deploy_diagnostics_eventgridtopic_policyrule
  policy_parameters     = var.policyDefinition-deploy_diagnostics_eventgridtopic-parameters
}


variable "policyDefinition_deploy_diagnostics_eventgridtopic_policyrule" {
    type = string
}

variable "policyDefinition_deploy_diagnostics_eventgridtopic_parameters" {
    type    = string
    default = ""
}

resource "azurerm_policy_definition" "deploy_diagnostics_servicebus" {
  name                  = "Deploy-Diagnostics-ServiceBus"
  policy_type           = "Custom"
  mode                  = "All"
  display_name          = "Deploy-Diagnostics-ServiceBus"
  description           = "Apply diagnostic settings for Service Bus namespaces - Log Analytics"

  management_group_name = azurerm_management_group.es.name
  policy_rule           = var.policydefinition_deploy_diagnostics_servicebus_policyrule
  policy_parameters     = var.policyDefinition-deploy_diagnostics_servicebus-parameters
}

variable "policydefinition_deploy_diagnostics_servicebus_policyrule" {
    type = string
}

variable "policydefinition_deploy_diagnostics_servicebus_parameters" {
    type    = string
    default = ""
}

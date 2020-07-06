resource "azurerm_policy_definition" "deploy_nsg_flowlogs" {
  name         = "Deploy-Nsg-FlowLogs"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Deploy-Nsg-FlowLogs"
  description  = "null"

  management_group_name = azurerm_management_group.es.name
  policy_rule           = var.policydefinition_deploy_nsg_flowlogs_policyrule
  parameters            = var.policydefinition_deploy_nsg_flowlogs_parameters
}

variable "policydefinition_deploy_nsg_flowlogs_policyrule" {
  type = string
}

variable "policydefinition_deploy_nsg_flowlogs_parameters" {
  type    = string
  default = ""
}

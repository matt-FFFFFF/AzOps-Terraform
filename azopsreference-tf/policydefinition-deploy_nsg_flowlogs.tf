resource "azurerm_policy_definition" "deploy_nsg_flowlogs" {
  name                  = "Deploy-Nsg-FlowLogs"
  policy_type           = "Custom"
  mode                  = "All"
  display_name          = "Deploy-Nsg-FlowLogs"
  description           = "null"

  management_group_name = azurerm_management_group.<changeme>.name
  policy_rule           = var.policyDefinition_deploy_nsg_flowlogs_policyrule
  policy_parameters     = var.policyDefinition-deploy_nsg_flowlogs-parameters
}


variable "policyDefinition_deploy_nsg_flowlogs_policyrule" {
    type = string
}

variable "policyDefinition_deploy_nsg_flowlogs_parameters" {
    type    = string
    default = ""
}

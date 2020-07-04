resource "azurerm_policy_definition" "deploy_diagnostics_vnetgw" {
  name                  = "Deploy-Diagnostics-VNetGW"
  policy_type           = "Custom"
  mode                  = "All"
  display_name          = "Deploy-Diagnostics-VNetGW"
  description           = "Apply diagnostic settings for Virtual Network Gateways - Log Analytics"

  management_group_name = azurerm_management_group.<changeme>.name
  policy_rule           = var.policyDefinition_deploy_diagnostics_vnetgw_policyrule
  policy_parameters     = var.policyDefinition-deploy_diagnostics_vnetgw-parameters
}


variable "policyDefinition_deploy_diagnostics_vnetgw_policyrule" {
    type = string
}

variable "policyDefinition_deploy_diagnostics_vnetgw_parameters" {
    type    = string
    default = ""
}

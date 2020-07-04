resource "azurerm_policy_definition" "deploy_diagnostics_publicip" {
  name                  = "Deploy-Diagnostics-PublicIP"
  policy_type           = "Custom"
  mode                  = "All"
  display_name          = "Deploy-Diagnostics-PublicIP"
  description           = "Apply diagnostic settings for Public IPs - Log Analytics"

  management_group_name = azurerm_management_group.es.name
  policy_rule           = var.policydefinition_deploy_diagnostics_publicip_policyrule
  parameters            = var.policydefinition_deploy_diagnostics_publicip_parameters
}

variable "policydefinition_deploy_diagnostics_publicip_policyrule" {
    type = string
}

variable "policydefinition_deploy_diagnostics_publicip_parameters" {
    type    = string
    default = ""
}

resource "azurerm_policy_definition" "deploy_diagnostics_vmss" {
  name         = "Deploy-Diagnostics-VMSS"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Deploy-Diagnostics-VMSS"
  description  = "Apply diagnostic settings for Virtual Machine Scale Sets - Log Analytics"

  management_group_name = azurerm_management_group.es.name
  policy_rule           = var.policydefinition_deploy_diagnostics_vmss_policyrule
  parameters            = var.policydefinition_deploy_diagnostics_vmss_parameters
}

variable "policydefinition_deploy_diagnostics_vmss_policyrule" {
  type = string
}

variable "policydefinition_deploy_diagnostics_vmss_parameters" {
  type    = string
  default = ""
}

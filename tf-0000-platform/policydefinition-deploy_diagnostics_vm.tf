resource "azurerm_policy_definition" "deploy_diagnostics_vm" {
  name         = "Deploy-Diagnostics-VM"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Deploy-Diagnostics-VM"
  description  = "Apply diagnostic settings for Virtual Machines - Log Analytics"

  management_group_name = azurerm_management_group.es.name
  policy_rule           = var.policydefinition_deploy_diagnostics_vm_policyrule
  parameters            = var.policydefinition_deploy_diagnostics_vm_parameters
}

variable "policydefinition_deploy_diagnostics_vm_policyrule" {
  type = string
}

variable "policydefinition_deploy_diagnostics_vm_parameters" {
  type    = string
  default = ""
}

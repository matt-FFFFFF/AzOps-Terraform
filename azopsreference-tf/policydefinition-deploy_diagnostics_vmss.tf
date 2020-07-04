resource "azurerm_policy_definition" "deploy_diagnostics_vmss" {
  name                  = "Deploy-Diagnostics-VMSS"
  policy_type           = "Custom"
  mode                  = "All"
  display_name          = "Deploy-Diagnostics-VMSS"
  description           = "Apply diagnostic settings for Virtual Machine Scale Sets - Log Analytics"

  management_group_name = azurerm_management_group.<changeme>.name
  policy_rule           = var.policyDefinition_deploy_diagnostics_vmss_policyrule
  policy_parameters     = var.policyDefinition-deploy_diagnostics_vmss-parameters
}


variable "policyDefinition_deploy_diagnostics_vmss_policyrule" {
    type = string
}

variable "policyDefinition_deploy_diagnostics_vmss_parameters" {
    type    = string
    default = ""
}

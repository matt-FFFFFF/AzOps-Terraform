resource "azurerm_policy_definition" "deploy_diagnostics_recoveryvault" {
  name         = "Deploy-Diagnostics-RecoveryVault"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Deploy-Diagnostics-RecoveryVault"
  description  = "Apply diagnostic settings for Recovery Vaults - Log Analytics"

  management_group_name = azurerm_management_group.es.name
  policy_rule           = var.policydefinition_deploy_diagnostics_recoveryvault_policyrule
  parameters            = var.policydefinition_deploy_diagnostics_recoveryvault_parameters
}

variable "policydefinition_deploy_diagnostics_recoveryvault_policyrule" {
  type = string
}

variable "policydefinition_deploy_diagnostics_recoveryvault_parameters" {
  type    = string
  default = ""
}

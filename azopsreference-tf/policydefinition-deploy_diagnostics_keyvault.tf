resource "azurerm_policy_definition" "deploy_diagnostics_keyvault" {
  name                  = "Deploy-Diagnostics-KeyVault"
  policy_type           = "Custom"
  mode                  = "All"
  display_name          = "Deploy-Diagnostics-KeyVault"
  description           = "Apply diagnostic settings for Key Vaults - Log Analytics"

  management_group_name = azurerm_management_group.es.name
  policy_rule           = var.policydefinition_deploy_diagnostics_keyvault_policyrule
  policy_parameters     = var.policyDefinition-deploy_diagnostics_keyvault-parameters
}

variable "policydefinition_deploy_diagnostics_keyvault_policyrule" {
    type = string
}

variable "policydefinition_deploy_diagnostics_keyvault_parameters" {
    type    = string
    default = ""
}

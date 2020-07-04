resource "azurerm_policy_definition" "deploy_diagnostics_acr" {
  name                  = "Deploy-Diagnostics-ACR"
  policy_type           = "Custom"
  mode                  = "All"
  display_name          = "Deploy-Diagnostics-ACR"
  description           = "Apply diagnostic settings for Azure Container Registries - Log Analytics"

  management_group_name = azurerm_management_group.es.name
  policy_rule           = var.policydefinition_deploy_diagnostics_acr_policyrule
  policy_parameters     = var.policyDefinition-deploy_diagnostics_acr-parameters
}

variable "policydefinition_deploy_diagnostics_acr_policyrule" {
    type = string
}

variable "policydefinition_deploy_diagnostics_acr_parameters" {
    type    = string
    default = ""
}

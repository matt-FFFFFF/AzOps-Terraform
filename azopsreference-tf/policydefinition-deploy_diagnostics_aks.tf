resource "azurerm_policy_definition" "deploy_diagnostics_aks" {
  name                  = "Deploy-Diagnostics-AKS"
  policy_type           = "Custom"
  mode                  = "All"
  display_name          = "Deploy-Diagnostics-AKS"
  description           = "Apply diagnostic settings for Azure Kubernetes Service - Log Analytics"

  management_group_name = azurerm_management_group.<changeme>.name
  policy_rule           = var.policyDefinition_deploy_diagnostics_aks_policyrule
  policy_parameters     = var.policyDefinition-deploy_diagnostics_aks-parameters
}


variable "policyDefinition_deploy_diagnostics_aks_policyrule" {
    type = string
}

variable "policyDefinition_deploy_diagnostics_aks_parameters" {
    type    = string
    default = ""
}

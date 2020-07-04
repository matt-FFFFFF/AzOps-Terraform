resource "azurerm_policy_definition" "deploy_diagnostics_aks" {
  name                  = "Deploy-Diagnostics-AKS"
  policy_type           = "Custom"
  mode                  = "All"
  display_name          = "Deploy-Diagnostics-AKS"
  description           = "Apply diagnostic settings for Azure Kubernetes Service - Log Analytics"

  management_group_name = azurerm_management_group.es.name
  policy_rule           = var.policydefinition_deploy_diagnostics_aks_policyrule
  parameters            = var.policydefinition_deploy_diagnostics_aks_parameters
}

variable "policydefinition_deploy_diagnostics_aks_policyrule" {
    type = string
}

variable "policydefinition_deploy_diagnostics_aks_parameters" {
    type    = string
    default = ""
}

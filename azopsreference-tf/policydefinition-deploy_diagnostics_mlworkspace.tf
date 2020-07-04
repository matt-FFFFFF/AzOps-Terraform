resource "azurerm_policy_definition" "deploy_diagnostics_mlworkspace" {
  name                  = "Deploy-Diagnostics-MlWorkspace"
  policy_type           = "Custom"
  mode                  = "Indexed"
  display_name          = "Deploy-Diagnostics-MlWorkspace"
  description           = "Apply diagnostic settings for Ml Workspace - Log Analytics"

  management_group_name = azurerm_management_group.es.name
  policy_rule           = var.policydefinition_deploy_diagnostics_mlworkspace_policyrule
  policy_parameters     = var.policyDefinition-deploy_diagnostics_mlworkspace-parameters
}

variable "policydefinition_deploy_diagnostics_mlworkspace_policyrule" {
    type = string
}

variable "policydefinition_deploy_diagnostics_mlworkspace_parameters" {
    type    = string
    default = ""
}

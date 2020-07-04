resource "azurerm_policy_definition" "deploy_diagnostics_aci" {
  name                  = "Deploy-Diagnostics-ACI"
  policy_type           = "Custom"
  mode                  = "All"
  display_name          = "Deploy-Diagnostics-ACI"
  description           = "Apply diagnostic settings for Azure Container Instances - Log Analytics"

  management_group_name = azurerm_management_group.es.name
  policy_rule           = var.policydefinition_deploy_diagnostics_aci_policyrule
  policy_parameters     = var.policyDefinition-deploy_diagnostics_aci-parameters
}

variable "policydefinition_deploy_diagnostics_aci_policyrule" {
    type = string
}

variable "policydefinition_deploy_diagnostics_aci_parameters" {
    type    = string
    default = ""
}

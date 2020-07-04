resource "azurerm_policy_definition" "deploy_diagnostics_searchservices" {
  name                  = "Deploy-Diagnostics-SearchServices"
  policy_type           = "Custom"
  mode                  = "All"
  display_name          = "Deploy-Diagnostics-SearchServices"
  description           = "Apply diagnostic settings for Search Services - Log Analytics"

  management_group_name = azurerm_management_group.<changeme>.name
  policy_rule           = var.policyDefinition_deploy_diagnostics_searchservices_policyrule
  policy_parameters     = var.policyDefinition-deploy_diagnostics_searchservices-parameters
}


variable "policyDefinition_deploy_diagnostics_searchservices_policyrule" {
    type = string
}

variable "policyDefinition_deploy_diagnostics_searchservices_parameters" {
    type    = string
    default = ""
}

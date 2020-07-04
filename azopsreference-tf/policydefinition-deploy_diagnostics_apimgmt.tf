resource "azurerm_policy_definition" "deploy_diagnostics_apimgmt" {
  name                  = "Deploy-Diagnostics-APIMgmt"
  policy_type           = "Custom"
  mode                  = "All"
  display_name          = "Deploy-Diagnostics-APIMgmt"
  description           = "Apply diagnostic settings for API Management services - Log Analytics"

  management_group_name = azurerm_management_group.<changeme>.name
  policy_rule           = var.policyDefinition_deploy_diagnostics_apimgmt_policyrule
  policy_parameters     = var.policyDefinition-deploy_diagnostics_apimgmt-parameters
}


variable "policyDefinition_deploy_diagnostics_apimgmt_policyrule" {
    type = string
}

variable "policyDefinition_deploy_diagnostics_apimgmt_parameters" {
    type    = string
    default = ""
}

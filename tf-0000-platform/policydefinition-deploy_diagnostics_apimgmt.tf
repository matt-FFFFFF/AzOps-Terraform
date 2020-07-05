resource "azurerm_policy_definition" "deploy_diagnostics_apimgmt" {
  name                  = "Deploy-Diagnostics-APIMgmt"
  policy_type           = "Custom"
  mode                  = "All"
  display_name          = "Deploy-Diagnostics-APIMgmt"
  description           = "Apply diagnostic settings for API Management services - Log Analytics"

  management_group_name = azurerm_management_group.es.name
  policy_rule           = var.policydefinition_deploy_diagnostics_apimgmt_policyrule
  parameters            = var.policydefinition_deploy_diagnostics_apimgmt_parameters
}

variable "policydefinition_deploy_diagnostics_apimgmt_policyrule" {
    type = string
}

variable "policydefinition_deploy_diagnostics_apimgmt_parameters" {
    type    = string
    default = ""
}

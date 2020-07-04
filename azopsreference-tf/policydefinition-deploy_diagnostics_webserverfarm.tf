resource "azurerm_policy_definition" "deploy_diagnostics_webserverfarm" {
  name                  = "Deploy-Diagnostics-WebServerFarm"
  policy_type           = "Custom"
  mode                  = "All"
  display_name          = "Deploy-Diagnostics-WebServerFarm"
  description           = "Apply diagnostic settings for Azure App Service Plans - Log Analytics"

  management_group_name = azurerm_management_group.<changeme>.name
  policy_rule           = var.policyDefinition_deploy_diagnostics_webserverfarm_policyrule
  policy_parameters     = var.policyDefinition-deploy_diagnostics_webserverfarm-parameters
}


variable "policyDefinition_deploy_diagnostics_webserverfarm_policyrule" {
    type = string
}

variable "policyDefinition_deploy_diagnostics_webserverfarm_parameters" {
    type    = string
    default = ""
}

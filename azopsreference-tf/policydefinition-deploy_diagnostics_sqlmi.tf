resource "azurerm_policy_definition" "deploy_diagnostics_sqlmi" {
  name                  = "Deploy-Diagnostics-SQLMI"
  policy_type           = "Custom"
  mode                  = "All"
  display_name          = "Deploy-Diagnostics-SQLMI"
  description           = "Apply diagnostic settings for SQL Managed Instances - Log Analytics"

  management_group_name = azurerm_management_group.<changeme>.name
  policy_rule           = var.policyDefinition_deploy_diagnostics_sqlmi_policyrule
  policy_parameters     = var.policyDefinition-deploy_diagnostics_sqlmi-parameters
}


variable "policyDefinition_deploy_diagnostics_sqlmi_policyrule" {
    type = string
}

variable "policyDefinition_deploy_diagnostics_sqlmi_parameters" {
    type    = string
    default = ""
}

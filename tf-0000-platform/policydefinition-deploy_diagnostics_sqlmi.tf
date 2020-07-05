resource "azurerm_policy_definition" "deploy_diagnostics_sqlmi" {
  name         = "Deploy-Diagnostics-SQLMI"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Deploy-Diagnostics-SQLMI"
  description  = "Apply diagnostic settings for SQL Managed Instances - Log Analytics"

  management_group_name = azurerm_management_group.es.name
  policy_rule           = var.policydefinition_deploy_diagnostics_sqlmi_policyrule
  parameters            = var.policydefinition_deploy_diagnostics_sqlmi_parameters
}

variable "policydefinition_deploy_diagnostics_sqlmi_policyrule" {
  type = string
}

variable "policydefinition_deploy_diagnostics_sqlmi_parameters" {
  type    = string
  default = ""
}

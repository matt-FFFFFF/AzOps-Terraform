resource "azurerm_policy_definition" "deploy_diagnostics_batch" {
  name         = "Deploy-Diagnostics-Batch"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Deploy-Diagnostics-Batch"
  description  = "Apply diagnostic settings for Azure Batch accounts - Log Analytics"

  management_group_name = azurerm_management_group.es.name
  policy_rule           = var.policydefinition_deploy_diagnostics_batch_policyrule
  parameters            = var.policydefinition_deploy_diagnostics_batch_parameters
}

variable "policydefinition_deploy_diagnostics_batch_policyrule" {
  type = string
}

variable "policydefinition_deploy_diagnostics_batch_parameters" {
  type    = string
  default = ""
}

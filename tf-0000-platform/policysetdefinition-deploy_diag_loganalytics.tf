resource "azurerm_policy_set_definition" "deploy_diag_loganalytics" {
  name               = "Deploy-Diag-LogAnalytics"
  policy_type        = "Custom"
  display_name       = "Deploy-Diag-LogAnalytics"
  description        = "This initiative configures application Azure resources to forward diagnostic logs and metrics to an Azure Log Analytics workspace."
  policy_definitions = var.policysetdefinition_deploy_diag_loganalytics_policydefinitions
  parameters         = var.policysetdefinition_deploy_diag_loganalytics_parameters
}

variable "policysetdefinition_deploy_diag_loganalytics_policydefinitions" {
  type = string
}

variable "policysetdefinition_deploy_diag_loganalytics_parameters" {
  type    = string
  default = ""
}

resource "azurerm_policy_definition" "deploy_diagnostics_hdinsight" {
  name                  = "Deploy-Diagnostics-HDInsight"
  policy_type           = "Custom"
  mode                  = "All"
  display_name          = "Deploy-Diagnostics-HDInsight"
  description           = "Apply diagnostic settings for HDInsight - Log Analytics"

  management_group_name = azurerm_management_group.es.name
  policy_rule           = var.policydefinition_deploy_diagnostics_hdinsight_policyrule
  parameters            = var.policydefinition_deploy_diagnostics_hdinsight_parameters
}

variable "policydefinition_deploy_diagnostics_hdinsight_policyrule" {
    type = string
}

variable "policydefinition_deploy_diagnostics_hdinsight_parameters" {
    type    = string
    default = ""
}

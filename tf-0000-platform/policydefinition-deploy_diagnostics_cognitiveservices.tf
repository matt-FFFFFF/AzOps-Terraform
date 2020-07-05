resource "azurerm_policy_definition" "deploy_diagnostics_cognitiveservices" {
  name                  = "Deploy-Diagnostics-CognitiveServices"
  policy_type           = "Custom"
  mode                  = "All"
  display_name          = "Deploy-Diagnostics-CognitiveServices"
  description           = "Apply diagnostic settings for Cognitive Services - Log Analytics"

  management_group_name = azurerm_management_group.es.name
  policy_rule           = var.policydefinition_deploy_diagnostics_cognitiveservices_policyrule
  parameters            = var.policydefinition_deploy_diagnostics_cognitiveservices_parameters
}

variable "policydefinition_deploy_diagnostics_cognitiveservices_policyrule" {
    type = string
}

variable "policydefinition_deploy_diagnostics_cognitiveservices_parameters" {
    type    = string
    default = ""
}

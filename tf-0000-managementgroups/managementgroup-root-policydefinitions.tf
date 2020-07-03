resource "azurerm_policy_definition" "deploy-log-analytics" {
  name         = "Deploy-Log-Analytics"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Deploy-LogAnalytics"
  management_group_name = azurerm_management_group.root.name
  metadata     = var.policyDefinition-Deploy-Log-Analytics-metadata
  policy_rule  = var.policyDefinition-Deploy-Log-Analytics-policyrule
  parameters   = var.policyDefinition-Deploy-Log-Analytics-parameters
}

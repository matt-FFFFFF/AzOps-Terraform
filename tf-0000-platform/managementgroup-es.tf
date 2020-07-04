resource "azurerm_policy_definition" "deploy_diagnostics_activitylog" {
  name         = "Deploy-Diagnostics-ActivityLog"
  policy_type  = "Custom"
  mode         = "Indexed"
  display_name = "acceptance test policy definition"

  policy_rule = var.policyDefinition-Deploy-Diagnostics-ActivityLog-policyrule

  parameters = 

}
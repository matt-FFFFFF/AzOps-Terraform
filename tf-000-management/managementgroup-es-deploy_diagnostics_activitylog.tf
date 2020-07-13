resource "azurerm_policy_assignment" "deploy_diagnostics_activitylog" {
  name                 = "Deploy-Diag-ActivityLog"
  scope                = azurerm_management_group.es.id
  policy_definition_id = module.azopsreference.policydefinition_deploy_diagnostics_activitylog.id
  description          = "Ensure subscriptions have activity logs sent to log analytics"
  display_name         = "Deploy-Diagnotics-ActivityLog"
  location             = var.default_location

  identity {
    type = "SystemAssigned"
  }

  parameters = <<PARAMETERS
{
  "logAnalytics": {
    "value": "${azurerm_log_analytics_workspace.mgmt.id}"
  }
}
PARAMETERS

}

/* resource "azurerm_policy_remediation" "deploy_diagnostics_activitylog" {
  name                 = "deploy-diag-activitylog"
  scope                = azurerm_management_group.es.id
  policy_assignment_id = azurerm_policy_assignment.deploy_diagnostics_activitylog.id
}

resource "azurerm_role_assignment" "deploy_diagnostics_activitylog" {
  scope                = azurerm_management_group.es.id
  role_definition_name = "Owner"
  principal_id         = azurerm_policy_assignment.deploy_diagnostics_activitylog.identity[0].principal_id
} */

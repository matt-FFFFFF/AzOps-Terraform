resource "azurerm_policy_assignment" "deploy_diagnostics_activitylog" {
  name                 = "Deploy-Diag-ActivityLog"
  scope                = module.managementgroups.mgs["ES"].name
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

resource "azurerm_policy_remediation" "deploy_diagnostics_activitylog" {
  name                 = "deploy-diag-activitylog"
  scope                = module.managementgroups.mgs["ES"].name
  policy_assignment_id = azurerm_policy_assignment.deploy_diagnostics_activitylog.id
}

resource "azurerm_role_assignment" "deploy_diagnostics_activitylog" {
  scope                = module.managementgroups.mgs["ES"].name
  role_definition_name = "Owner"
  principal_id         = azurerm_policy_assignment.deploy_diagnostics_activitylog.identity[0].principal_id
}

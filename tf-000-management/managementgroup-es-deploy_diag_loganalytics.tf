resource "azurerm_policy_assignment" "deploy_diag_loganalytics" {
  name                 = "Deploy-Diag-LogAnalytics"
  scope                = module.managementgroups.mgs["ES"].name
  policy_definition_id = module.azopsreference.policysetdefinition_deploy_diag_loganalytics.id
  description          = "Ensure resources have diagnostic settings configured to forward to Log Analytics"
  display_name         = "Deploy-Diag-LogAnalytics"
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

resource "azurerm_policy_remediation" "deploy_diag_loganalytics" {
  count                          = length(module.azopsreference.diagnostic_policy_definitions)
  name                           = lower(module.azopsreference.diagnostic_policy_definitions[count.index].name)
  scope                          = module.managementgroups.mgs["ES"].name
  policy_assignment_id           = azurerm_policy_assignment.deploy_diag_loganalytics.id
  policy_definition_reference_id = replace(module.azopsreference.diagnostic_policy_definitions[count.index].name, "-", "")
}

resource "azurerm_role_assignment" "deploy_diag_loganalytics" {
  scope                = module.managementgroups.mgs["ES"].name
  role_definition_name = "Contributor"
  principal_id         = azurerm_policy_assignment.deploy_diag_loganalytics.identity[0].principal_id
}

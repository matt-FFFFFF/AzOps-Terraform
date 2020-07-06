resource "azurerm_policy_assignment" "deploy_diag_loganalytics" {
  name                 = "Deploy-Diag-LogAnalytics"
  scope                = azurerm_management_group.es.id
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
  name                           = uuidv5("dns", "www.${module.azopsreference.diagnostic_policy_definitions[count.index].name}.com")
  scope                          = azurerm_management_group.es.id
  policy_assignment_id           = azurerm_policy_assignment.deploy_diag_loganalytics.id
  policy_definition_reference_id = module.azopsreference.diagnostic_policy_definitions[count.index].id
  location_filters               = ["West Europe", "North Europe", "UK South"]
}

resource "azurerm_role_assignment" "deploy_diag_loganalytics" {
  scope                = azurerm_management_group.es.id
  role_definition_name = "Owner"
  principal_id         = azurerm_policy_assignment.deploy_diag_loganalytics.identity[0].principal_id
}

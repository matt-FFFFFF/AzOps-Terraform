resource "azurerm_policy_assignment" "deploy-log-analytics-childmg" {
  name                 = "DeployDiagLogAnalytics"
  scope                = azurerm_management_group.childmg.id
  policy_definition_id = azurerm_policy_definition.deploy-log-analytics.id
  description          = "Deploys Log Analytics"
  display_name         = "Deploy-Diag-LogAnalytics"
  location             = "westeurope"
  
  identity {
    type = "SystemAssigned"
  }

  parameters = <<PARAMETERS
{
  "rgName": {
    "value": "automagic"
  },
  "workspaceName": {
    "value": "jvnsivmslasopfasf"
  },
  "automationAccountName": {
    "value": "jvnsivmslasopfasf"
  },
  "automationRegion": {
    "value": "westeurope"
  },
  "workspaceRegion": {
    "value": "westeurope"
  }
}
PARAMETERS
}

resource "azurerm_role_assignment" "deploy-log-analytics-childmg" {
  scope                = azurerm_policy_assignment.deploy-log-analytics-childmg.scope
  role_definition_name = "Contributor"
  principal_id         = azurerm_policy_assignment.deploy-log-analytics-childmg.identity[0].principal_id
}

resource "azurerm_policy_remediation" "deploy-log-analytics-childmg" {
  name                 = "remediatedeploydiagloganalytics"
  scope                = azurerm_policy_assignment.deploy-log-analytics-childmg.scope
  policy_assignment_id = azurerm_policy_assignment.deploy-log-analytics-childmg.id
}

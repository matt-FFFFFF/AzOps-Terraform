resource "azurerm_policy_set_definition" "deny_publicendpoints" {
  name               = "Deny-PublicEndpoints"
  policy_type        = "Custom"
  display_name       = "Deny-Public-Endpoints-for-PaaS-Services"
  description        = "null"
  policy_definitions = var.policysetdefinition_deny_publicendpoints_policydefinitions
  
}

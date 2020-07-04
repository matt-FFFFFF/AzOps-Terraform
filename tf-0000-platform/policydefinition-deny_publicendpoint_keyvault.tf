resource "azurerm_policy_definition" "deny_publicendpoint_keyvault" {
  name                  = "Deny-PublicEndpoint-KeyVault"
  policy_type           = "Custom"
  mode                  = "All"
  display_name          = "Deny-PublicEndpoint-KeyVault"
  description           = "This policy restrict creation of Key Vaults with IP Firewall exposed to all public endpoints"

  management_group_name = azurerm_management_group.es.name
  policy_rule           = var.policydefinition_deny_publicendpoint_keyvault_policyrule
  
}

variable "policydefinition_deny_publicendpoint_keyvault_policyrule" {
    type = string
}

variable "policydefinition_deny_publicendpoint_keyvault_parameters" {
    type    = string
    default = ""
}

resource "azurerm_policy_definition" "deny_publicendpoint_aks" {
  name                  = "Deny-PublicEndpoint-Aks"
  policy_type           = "Custom"
  mode                  = "All"
  display_name          = "Deny-PublicEndpoint-Aks"
  description           = "This policy restricts creation of non-private AKS clusters"

  management_group_name = azurerm_management_group.es.name
  policy_rule           = var.policydefinition_deny_publicendpoint_aks_policyrule
  
}

variable "policydefinition_deny_publicendpoint_aks_policyrule" {
    type = string
}

variable "policydefinition_deny_publicendpoint_aks_parameters" {
    type    = string
    default = ""
}

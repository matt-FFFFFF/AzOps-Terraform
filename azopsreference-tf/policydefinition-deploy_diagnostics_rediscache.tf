resource "azurerm_policy_definition" "deploy_diagnostics_rediscache" {
  name                  = "Deploy-Diagnostics-RedisCache"
  policy_type           = "Custom"
  mode                  = "All"
  display_name          = "Deploy-Diagnostics-RedisCache"
  description           = "Apply diagnostic settings for Redis Cache - Log Analytics"

  management_group_name = azurerm_management_group.<changeme>.name
  policy_rule           = var.policyDefinition_deploy_diagnostics_rediscache_policyrule
  policy_parameters     = var.policyDefinition-deploy_diagnostics_rediscache-parameters
}


variable "policyDefinition_deploy_diagnostics_rediscache_policyrule" {
    type = string
}

variable "policyDefinition_deploy_diagnostics_rediscache_parameters" {
    type    = string
    default = ""
}

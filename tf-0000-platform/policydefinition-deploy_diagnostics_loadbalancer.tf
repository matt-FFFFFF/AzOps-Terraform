resource "azurerm_policy_definition" "deploy_diagnostics_loadbalancer" {
  name         = "Deploy-Diagnostics-LoadBalancer"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Deploy-Diagnostics-LoadBalancer"
  description  = "Apply diagnostic settings for Load Balancers - Log Analytics"

  management_group_name = azurerm_management_group.es.name
  policy_rule           = var.policydefinition_deploy_diagnostics_loadbalancer_policyrule
  parameters            = var.policydefinition_deploy_diagnostics_loadbalancer_parameters
}

variable "policydefinition_deploy_diagnostics_loadbalancer_policyrule" {
  type = string
}

variable "policydefinition_deploy_diagnostics_loadbalancer_parameters" {
  type    = string
  default = ""
}

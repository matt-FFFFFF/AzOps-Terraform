resource "azurerm_policy_definition" "deploy_diagnostics_loadbalancer" {
  name                  = "Deploy-Diagnostics-LoadBalancer"
  policy_type           = "Custom"
  mode                  = "All"
  display_name          = "Deploy-Diagnostics-LoadBalancer"
  description           = "Apply diagnostic settings for Load Balancers - Log Analytics"

  management_group_name = azurerm_management_group.<changeme>.name
  policy_rule           = var.policyDefinition_deploy_diagnostics_loadbalancer_policyrule
  policy_parameters     = var.policyDefinition-deploy_diagnostics_loadbalancer-parameters
}


variable "policyDefinition_deploy_diagnostics_loadbalancer_policyrule" {
    type = string
}

variable "policyDefinition_deploy_diagnostics_loadbalancer_parameters" {
    type    = string
    default = ""
}

resource "azurerm_policy_definition" "deploy_azurebackup_on_vm" {
  name         = "Deploy-AzureBackup-on-VM"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Deploy-AzureBackup-on-VMs"
  description  = "null"

  management_group_name = azurerm_management_group.es.name
  policy_rule           = var.policydefinition_deploy_azurebackup_on_vm_policyrule

}

variable "policydefinition_deploy_azurebackup_on_vm_policyrule" {
  type = string
}

variable "policydefinition_deploy_azurebackup_on_vm_parameters" {
  type    = string
  default = ""
}

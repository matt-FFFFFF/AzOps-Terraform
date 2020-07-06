resource "azurerm_policy_definition" "append_kv_softdelete" {
  name         = "Append-KV-SoftDelete"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Append-KV-SoftDelete"
  description  = "When a Key Vault is created with out soft delete enabled then this will add it."

  management_group_name = azurerm_management_group.es.name
  policy_rule           = var.policydefinition_append_kv_softdelete_policyrule

}

variable "policydefinition_append_kv_softdelete_policyrule" {
  type = string
}

variable "policydefinition_append_kv_softdelete_parameters" {
  type    = string
  default = ""
}

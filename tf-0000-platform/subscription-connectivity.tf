resource "azurerm_resource_group" "vwan" {
  provider = azurerm.connectivity
  name     = var.vwan_rg_name
  location = var.default_location
}

resource "azurerm_virtual_wan" "global_vwan" {
  provider            = azurerm.connectivity
  name                = var.vwan_name
  resource_group_name = azurerm_resource_group.vwan.name
  location            = azurerm_resource_group.vwan.location

  disable_vpn_encryption            = false
  allow_branch_to_branch_traffic    = true
  allow_vnet_to_vnet_traffic        = true
  type                              = "Standard"
  office365_local_breakout_category = "None"
}

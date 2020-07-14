resource "azurerm_resource_group" "vwan" {
  name     = var.vwan_rg_name
  location = var.default_location
}

resource "azurerm_virtual_wan" "vwan" {
  name                = var.vwan_name
  resource_group_name = azurerm_resource_group.vwan.name
  location            = azurerm_resource_group.vwan.location
}
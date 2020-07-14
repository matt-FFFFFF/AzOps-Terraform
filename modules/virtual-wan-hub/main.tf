resource "azurerm_virtual_hub" "vhub" {
  name                = "vhub-${var.location}"
  resource_group_name = var.resource_group_name
  location            = var.location
  virtual_wan_id      = var.virtual_wan_id
  address_prefix      = var.vhub_address_prefix
}

resource "azurerm_point_to_site_vpn_gateway" "p2s" {
  count                       = var.p2s_configuration.enabled ? 1 : 0
  name                        = "p2s-${var.location}"
  location                    = var.location
  resource_group_name         = var.resource_group_name
  virtual_hub_id              = azurerm_virtual_hub.vhub.id
  vpn_server_configuration_id = var.p2s_configuration.configuration_id
  scale_unit                  = var.p2s_configuration.scale_units
}

resource "azurerm_express_route_gateway" "er" {
  count               = var.er_configuration.enabled ? 1 : 0
  name                = "er-${var.location}"
  resource_group_name = var.resource_group_name
  location            = var.location
  virtual_hub_id      = azurerm_virtual_hub.vhub.id
  scale_units         = var.er_configuration.scale_units
}

resource "azurerm_vpn_gateway" "s2s" {
  name                = "s2s-${var.location}"
  location            = var.location
  resource_group_name = var.resource_group_name
  virtual_hub_id      = azurerm_virtual_hub.vhub.id
}

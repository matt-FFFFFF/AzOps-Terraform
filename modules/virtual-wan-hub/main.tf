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
  virtual_hub_id              = var.virtual_wan_id
  vpn_server_configuration_id = var.p2s_configuration.configuration_id
  scale_unit                  = var.p2s_configuration.scale_units
}

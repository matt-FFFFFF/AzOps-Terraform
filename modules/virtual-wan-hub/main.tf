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
  scale_unit                  = var.p2s_configuration.scale_unit
  connection_configuration {
    name = "p2sconfig-${var.location}"
    vpn_client_address_pool {
      address_prefixes = var.p2s_configuration.client_address_prefixes
    }
  }
}

resource "azurerm_express_route_gateway" "er" {
  count               = var.er_configuration.enabled ? 1 : 0
  name                = "er-${var.location}"
  resource_group_name = var.resource_group_name
  location            = var.location
  virtual_hub_id      = azurerm_virtual_hub.vhub.id
  scale_unit          = var.er_configuration.scale_unit
}

resource "azurerm_vpn_gateway" "s2s" {
  count               = var.er_configuration.enabled ? 1 : 0
  name                = "s2s-${var.location}"
  location            = var.location
  resource_group_name = var.resource_group_name
  virtual_hub_id      = azurerm_virtual_hub.vhub.id
  scale_unit          = var.s2s_configuration.scale_unit

  dynamic "bgp_settings" {
    for_each = var.s2s_configuration.bgp_enabled ? [true] : []
    content {
      asn         = var.s2s_configuration.bgp_asn
      peer_weight = var.s2s_configuration.bgp_peer_weight
    }
  }
}

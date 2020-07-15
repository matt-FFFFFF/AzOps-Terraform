/* module "vhub_westeurope" {
  source              = "../modules/virtual-wan-hub"
  location            = "westeurope"
  resource_group_name = azurerm_resource_group.vwan.name
  virtual_wan_id      = azure_virtual_wan.vwan.id
  vhub_address_prefix = "10.0.0.0/24"

  er_configuration = {
    enabled    = false
    scale_unit = 1
  }

  s2s_configuration = {
    enabled         = false
    scale_unit      = 1
    bgp_enabled     = false
    bgp_asn         = 65515
    bgp_peer_weight = 0
  }

  p2s_configuration = {
    enabled                 = false
    scale_unit              = 1
    configuration_id        = ""
    client_address_prefixes = [""]
  }
} */

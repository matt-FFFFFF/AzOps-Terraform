output "vhub" {
  description = "The Azure Virtual WAN hub object"
  value       = azurerm_virtual_hub.vhub
}

output "er" {
  description = "The Azure ExpressRoute gateway object"
  value       = azurerm_express_route_gateway.er
}

output "p2s" {
  description = "The Azure P2S gateway object"
  value       = azurerm_point_to_site_vpn_gateway.p2s
}

output "s2s" {
  description = "The Azure S2S gateway object"
  value       = azurerm_vpn_gateway.s2s
}

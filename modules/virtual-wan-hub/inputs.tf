variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "virtual_wan_id" {
  type = string
}

variable "vhub_address_prefix" {
  type = string
}

variable "p2s_configuration" {
  type = object({
    enabled                 = bool
    scale_unit              = number
    configuration_id        = string
    client_address_prefixes = list(string)
  })
  default = {
    enabled                 = false
    scale_unit              = 1
    configuration_id        = ""
    client_address_prefixes = [""]
  }
}

variable "er_configuration" {
  type = object({
    enabled    = bool
    scale_unit = number
  })
  default = {
    enabled    = false
    scale_unit = 1
  }
}

variable "s2s_configuration" {
  type = object({
    enabled         = bool
    scale_unit      = number
    bgp_enabled     = bool
    bgp_asn         = number
    bgp_peer_weight = number
  })
  default = {
    enabled         = false
    scale_unit      = 1
    bgp_enabled     = false
    bgp_asn         = 65515
    bgp_peer_weight = 0
  }
}

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
    enabled          = bool
    scale_units      = number
    configuration_id = string
  })
  default = {
    enabled          = false
    scale_units      = 1
    configuration_id = ""
  }
}

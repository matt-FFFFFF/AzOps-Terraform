variable "admin_user_object_id" {
  type    = string
  default = ""
}

variable "management_group_prefix" {
  type    = string
  default = "ES"
}

variable "default_location" {
  type    = string
  default = "westeurope"
}

variable "log_analytics_rg_name" {
  type    = string
  default = "ES-mgmt"
}

variable "management_groups_tier_0" {
  type    = map
  default = {}
}

variable "management_groups_tier_1" {
  type    = map
  default = {}
}

variable "management_groups_tier_2" {
  type    = map
  default = {}
}

variable "management_groups_tier_3" {
  type    = map
  default = {}
}

variable "management_groups_tier_4" {
  type    = map
  default = {}
}

variable "management_groups_tier_5" {
  type    = map
  default = {}
}

variable "management_groups_tier_6" {
  type    = map
  default = {}
}

variable "management_groups_tier_7" {
  type    = map
  default = {}
}

variable "management_groups_tier_8" {
  type    = map
  default = {}
}

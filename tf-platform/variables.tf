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

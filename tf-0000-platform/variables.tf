variable "my_object_id" {
  type = string
}

variable "mgmt_subscription_id" {
  type = string
}

variable "defaultlocation" {
  type    = string
  default = "westeurope"
}

variable "log_analytics_rg_name" {
  type = string
  default = "ES-mgmt"
}

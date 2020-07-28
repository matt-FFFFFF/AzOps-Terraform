variable "management_groups_tier_0" {
  type = map(object({
    display_name               = string
    parent_management_group_id = string
    subscription_ids           = set(string)
  }))
  default = {}
}

variable "management_groups_tier_1" {
  type = map(object({
    display_name               = string
    parent_management_group_id = string
    subscription_ids           = set(string)
  }))
  default = {}
}

variable "management_groups_tier_2" {
  type = map(object({
    display_name               = string
    parent_management_group_id = string
    subscription_ids           = set(string)
  }))
  default = {}
}

variable "management_groups_tier_3" {
  type = map(object({
    display_name               = string
    parent_management_group_id = string
    subscription_ids           = set(string)
  }))
  default = {}
}

variable "management_groups_tier_4" {
  type = map(object({
    display_name               = string
    parent_management_group_id = string
    subscription_ids           = set(string)
  }))
  default = {}
}

variable "management_groups_tier_5" {
  type = map(object({
    display_name               = string
    parent_management_group_id = string
    subscription_ids           = set(string)
  }))
  default = {}
}

variable "management_groups_tier_6" {
  type = map(object({
    display_name               = string
    parent_management_group_id = string
    subscription_ids           = set(string)
  }))
  default = {}
}

variable "management_groups_tier_7" {
  type = map(object({
    display_name               = string
    parent_management_group_id = string
    subscription_ids           = set(string)
  }))
  default = {}
}

variable "management_groups_tier_8" {
  type = map(object({
    display_name               = string
    parent_management_group_id = string
    subscription_ids           = set(string)
  }))
  default = {}
}

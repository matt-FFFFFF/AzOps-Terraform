terraform {
  required_version = "=0.12.28"
  backend "azurerm" {}
}

module "azopsreference" {
  source                = "../modules/azopsreference"
  management_group_name = module.managementgroups.mgs["ES"].name
}

data "azurerm_subscription" "management" {
}
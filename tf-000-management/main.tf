terraform {
  required_version = "=0.12.28"
  backend "azurerm" {}
}

module "azopsreference" {
  source                = "github.com/terraform-azurerm-modules/terraform-azurerm-azopsreference"
  management_group_name = azurerm_management_group.es.name
}

data "azurerm_subscription" "management" {
}
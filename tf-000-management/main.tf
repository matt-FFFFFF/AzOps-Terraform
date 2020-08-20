terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
  backend "azurerm" {}
  required_version = ">= 0.13"
}

module "azopsreference" {
  source                = "github.com/terraform-azurerm-modules/terraform-azurerm-azopsreference"
  management_group_name = azurerm_management_group.es.name
}

data "azurerm_subscription" "management" {
}
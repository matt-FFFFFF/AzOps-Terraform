terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
  backend "azurerm" {}
  required_version = ">= 0.13"
}

data "azurerm_subscription" "connectivity" {
}
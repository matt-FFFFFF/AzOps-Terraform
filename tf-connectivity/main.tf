terraform {
  required_version = "=0.12.28"
  backend "azurerm" {}
}

data "azurerm_subscription" "connectivity" {
}
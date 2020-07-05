provider "azurerm" {
  version = "~>2.17"
  subscription_id = var.mgmt_subscription_id
  features {}
}

provider "azurerm" {
  version = "~>2.17"
  alias = "connectivity"
  subscription_id = var.connectivity_subscription_id
  features {}
}
provider "azurerm" {
  version         = "~>2.17"
  subscription_id = var.mgmt_subscription_id
  features {}
}

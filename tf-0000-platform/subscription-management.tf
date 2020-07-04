resource "azurerm_resource_group" "es_mgmt" {
  name     = var.log_analytics_rg_name
  location = var.defaultlocation
}

resource "azurerm_log_analytics_workspace" "mgmt" {
  name                = "ES-la-${var.my_subscription_id}"
  location            = azurerm_resource_group.es_mgmt.location
  resource_group_name = azurerm_resource_group.es_mgmt.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_automation_account" "mgmt" {
  name                = "ES-a-${var.my_subscription_id}"
  location            = azurerm_resource_group.es_mgmt.location
  resource_group_name = azurerm_resource_group.es_mgmt.name

  sku_name = "Basic"
}

resource "azurerm_management_group" "es" {
  name         = var.management_group_prefix
  display_name = "ES"
}

resource "azurerm_role_assignment" "admin_user" {
  count                = var.admin_user_object_id == "" ? 0 : 1
  scope                = azurerm_management_group.es.id
  principal_id         = var.admin_user_object_id
  role_definition_name = "Reader"
}

resource "azurerm_management_group" "platform" {
  display_name = "Platform"
  name         = "${azurerm_management_group.es.name}-platform"

  parent_management_group_id = azurerm_management_group.es.id
}

resource "azurerm_management_group" "landingzones" {
  display_name = "LandingZones"
  name         = "${azurerm_management_group.es.name}-landingzones"

  parent_management_group_id = azurerm_management_group.es.id
}

resource "azurerm_management_group" "sandbox" {
  display_name = "Sandbox"
  name         = "${azurerm_management_group.es.name}-sandbox"

  parent_management_group_id = azurerm_management_group.es.id
}

resource "azurerm_management_group" "management" {
  display_name = "Management"
  name         = "${azurerm_management_group.es.name}-management"

  parent_management_group_id = azurerm_management_group.platform.id
  subscription_ids           = [data.azurerm_subscription.management.subscription_id]
}

resource "azurerm_management_group" "connectivity" {
  display_name = "Connectivity"
  name         = "${azurerm_management_group.es.name}-connectivity"

  parent_management_group_id = azurerm_management_group.platform.id
}

resource "azurerm_management_group" "identity" {
  display_name = "Identity"
  name         = "${azurerm_management_group.es.name}-identity"

  parent_management_group_id = azurerm_management_group.platform.id
}

resource "azurerm_management_group" "es" {
  name         = "ES-mawhi"
  display_name = "ES"
}

resource "azurerm_role_assignment" "mawhi" {
  scope                = azurerm_management_group.es.id
  principal_id         = var.my_object_id
  role_definition_name = "Owner"
}

resource "azurerm_management_group" "platform" {
  display_name = "Platform"
  name         = "ES-mawhi-platform"

  parent_management_group_id = azurerm_management_group.es.id
}

resource "azurerm_management_group" "landingzones" {
  display_name = "LandingZones"
  name         = "ES-mawhi-landingzones"

  parent_management_group_id = azurerm_management_group.es.id
}

resource "azurerm_management_group" "sandbox" {
  display_name = "Sandbox"
  name         = "ES-mawhi-sandbox"

  parent_management_group_id = azurerm_management_group.es.id
}

resource "azurerm_management_group" "management" {
  display_name = "Management"
  name         = "ES-mawhi-management"

  parent_management_group_id = azurerm_management_group.platform.id
  subscription_ids           = [var.mgmt_subscription_id]
}

resource "azurerm_management_group" "connectivity" {
  display_name = "Connectivity"
  name         = "ES-mawhi-connectivity"

  parent_management_group_id = azurerm_management_group.platform.id
}

resource "azurerm_management_group" "identity" {
  display_name = "Identity"
  name         = "ES-mawhi-identity"

  parent_management_group_id = azurerm_management_group.platform.id
}

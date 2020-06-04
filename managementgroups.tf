resource "azurerm_management_group" "root" {
  display_name = "Root"
  subscription_ids = [
    "814a2d9d-752d-4ecb-bb2a-fc0321152d4b"
  ]
}

resource "azurerm_management_group" "childmg" {
  display_name = "Child"
  name = "0ed2a5ff-bbc9-4d67-bd7e-cf311da6742a"
  parent_management_group_id = azurerm_management_group.root.id
}
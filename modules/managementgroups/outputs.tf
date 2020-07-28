output "mgs" {
  value = merge(
    azurerm_management_group.tier_0,
    azurerm_management_group.tier_1,
    azurerm_management_group.tier_2,
    azurerm_management_group.tier_3,
    azurerm_management_group.tier_4,
    azurerm_management_group.tier_5,
    azurerm_management_group.tier_6,
    azurerm_management_group.tier_7,
    azurerm_management_group.tier_8,
  )
}
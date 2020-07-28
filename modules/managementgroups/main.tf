terraform {
  required_providers {
    azurerm = ">= 2.18.0"
  }
}

resource "azurerm_management_group" "tier_0" {
  for_each     = var.management_groups_tier_0
  display_name = each.value.display_name
  name         = each.key
}

resource "azurerm_management_group" "tier_1" {
  for_each                   = var.management_groups_tier_1
  display_name               = each.value.display_name
  name                       = each.key
  parent_management_group_id = azurerm_management_group.tier_0[each.value.parent_management_group_id].id
  subscription_ids           = each.value.subscription_ids
}

resource "azurerm_management_group" "tier_2" {
  for_each                   = var.management_groups_tier_2
  display_name               = each.value.display_name
  name                       = each.key
  parent_management_group_id = azurerm_management_group.tier_1[each.value.parent_management_group_id].id
  subscription_ids           = each.value.subscription_ids
}

resource "azurerm_management_group" "tier_3" {
  for_each                   = var.management_groups_tier_3
  display_name               = each.value.display_name
  name                       = each.key
  parent_management_group_id = azurerm_management_group.tier_2[each.value.parent_management_group_id].id
  subscription_ids           = each.value.subscription_ids
}

resource "azurerm_management_group" "tier_4" {
  for_each                   = var.management_groups_tier_4
  display_name               = each.value.display_name
  name                       = each.key
  parent_management_group_id = azurerm_management_group.tier_3[each.value.parent_management_group_id].id
  subscription_ids           = each.value.subscription_ids
}

resource "azurerm_management_group" "tier_5" {
  for_each                   = var.management_groups_tier_5
  display_name               = each.value.display_name
  name                       = each.key
  parent_management_group_id = azurerm_management_group.tier_4[each.value.parent_management_group_id].id
  subscription_ids           = each.value.subscription_ids
}

resource "azurerm_management_group" "tier_6" {
  for_each                   = var.management_groups_tier_6
  display_name               = each.value.display_name
  name                       = each.key
  parent_management_group_id = azurerm_management_group.tier_5[each.value.parent_management_group_id].id
  subscription_ids           = each.value.subscription_ids
}

resource "azurerm_management_group" "tier_7" {
  for_each                   = var.management_groups_tier_7
  display_name               = each.value.display_name
  name                       = each.key
  parent_management_group_id = azurerm_management_group.tier_6[each.value.parent_management_group_id].id
  subscription_ids           = each.value.subscription_ids
}

resource "azurerm_management_group" "tier_8" {
  for_each                   = var.management_groups_tier_8
  display_name               = each.value.display_name
  name                       = each.key
  parent_management_group_id = azurerm_management_group.tier_7[each.value.parent_management_group_id].id
  subscription_ids           = each.value.subscription_ids
}
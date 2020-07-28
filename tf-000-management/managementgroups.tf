module "managementgroups" {
  source                   = "../modules/managementgroups"
  management_groups_tier_0 = var.management_groups_tier_0
  management_groups_tier_1 = var.management_groups_tier_1
  management_groups_tier_2 = var.management_groups_tier_2
}

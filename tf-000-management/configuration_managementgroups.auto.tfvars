management_groups_tier_0 = {
  ES = {
    display_name               = "ES"
    parent_management_group_id = ""
    subscription_ids           = []
  }
}

management_groups_tier_1 = {
  ES-platform = {
    display_name               = "Platform"
    parent_management_group_id = "ES2"
    subscription_ids           = []
  }
  ES-landingzones = {
    display_name               = "LandingZones"
    parent_management_group_id = "ES2"
    subscription_ids           = []
  }
}

management_groups_tier_2 = {
  ES-management = {
    display_name               = "Management"
    parent_management_group_id = "ES2-platform"
    subscription_ids           = ["be3ae466-f78a-4e60-b972-d9c35a4e7b3b"]
  }
  ES-landingzones = {
    display_name               = "LandingZones"
    parent_management_group_id = "ES2-platform"
    subscription_ids           = []
  }
}
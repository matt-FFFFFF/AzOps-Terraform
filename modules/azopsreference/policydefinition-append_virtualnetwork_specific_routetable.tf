# This file was auto generated
resource "azurerm_policy_definition" "append_virtualnetwork_specific_routetable" {
  name         = "Append-VirtualNetwork-Specific-RouteTable"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Append-VirtualNetwork-Specific-RouteTable"
  description  = "Appends a specific route table onto the first subnet created with a virtual network"

  management_group_name = var.management_group_name
  policy_rule           = <<POLICYRULE
null
POLICYRULE

  parameters = <<PARAMETERS
{
  "rtResourceGroupName": {
    "type": "String",
    "metadata": {
      "description": "Resource group name containing the route table",
      "displayName": "Route table resource group name"
    }
  },
  "rtName": {
    "type": "String",
    "metadata": {
      "description": "Route table name containing",
      "displayName": "Route table name"
    }
  }
}
PARAMETERS

}

output "policydefinition_append_virtualnetwork_specific_routetable" {
  value = azurerm_policy_definition.append_virtualnetwork_specific_routetable
}


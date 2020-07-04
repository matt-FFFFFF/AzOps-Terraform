policyDefinition_deny_subnet_without_nsg_policyrule = <<POLICYRULE
{
  "if": {
    "allof": [
      {
        "field": "type",
        "equals": "Microsoft.Network/virtualNetworks/subnets"
      },
      {
        "field": "Microsoft.Network/virtualNetworks/subnets/networkSecurityGroup.id",
        "exists": "false"
      }
    ]
  },
  "then": {
    "effect": "deny"
  }
}
POLICYRULE


policyDefinition-Deny-ERPeering-policyrule = <<POLICYRULE
{
  "if": {
    "field": "type",
    "equals": "Microsoft.Network/virtualNetworks/virtualNetworkPeerings"
  },
  "then": {
    "effect": "deny"
  }
}
POLICYRULE


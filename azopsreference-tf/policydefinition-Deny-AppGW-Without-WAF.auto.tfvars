policyDefinition-Deny-AppGW-Without-WAF-policyrule = <<POLICYRULE
{
  "if": {
    "allof": [
      {
        "field": "type",
        "equals": "Microsoft.Network/applicationGateways"
      },
      {
        "field": "Microsoft.Network/applicationGateways/sku.name",
        "notequals": "WAF_v2"
      }
    ]
  },
  "then": {
    "effect": "Deny"
  }
}
POLICYRULE


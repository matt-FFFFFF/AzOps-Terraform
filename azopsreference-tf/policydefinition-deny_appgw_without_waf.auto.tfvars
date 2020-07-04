policydefinition_deny_appgw_without_waf_policyrule = <<POLICYRULE
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


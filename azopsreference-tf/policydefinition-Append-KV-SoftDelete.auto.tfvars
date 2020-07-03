policyDefinition-Append-KV-SoftDelete-policyrule = <<POLICYRULE
{
  "if": {
    "anyof": [
      {
        "allof": [
          {
            "field": "type",
            "equals": "Microsoft.KeyVault/vaults"
          },
          {
            "field": "Microsoft.KeyVault/vaults/enableSoftDelete",
            "notequals": false
          }
        ]
      }
    ]
  },
  "then": {
    "effect": "append",
    "details": [
      {
        "field": "Microsoft.KeyVault/vaults/enableSoftDelete",
        "value": true
      }
    ]
  }
}
POLICYRULE


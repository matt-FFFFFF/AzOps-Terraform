policydefinition_append_kv_softdelete_policyrule = <<POLICYRULE
{
  "if": {
    "anyOf": [
      {
        "allOf": [
          {
            "field": "type",
            "equals": "Microsoft.KeyVault/vaults"
          },
          {
            "field": "Microsoft.KeyVault/vaults/enableSoftDelete",
            "notEquals": false
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


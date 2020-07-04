policydefinition_deny_publicendpoint_keyvault_policyrule = <<POLICYRULE
{
  "if": {
    "allof": [
      {
        "field": "type",
        "equals": "Microsoft.KeyVault/vaults"
      },
      {
        "field": "Microsoft.KeyVault/vaults/networkAcls.defaultAction",
        "notequals": "Deny"
      }
    ]
  },
  "then": {
    "effect": "Deny"
  }
}
POLICYRULE


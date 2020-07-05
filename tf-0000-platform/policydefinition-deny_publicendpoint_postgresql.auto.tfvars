policydefinition_deny_publicendpoint_postgresql_policyrule = <<POLICYRULE
{
  "if": {
    "allOf": [
      {
        "field": "type",
        "equals": "Microsoft.DBforPostgreSQL/servers"
      },
      {
        "field": "Microsoft.DBforPostgreSQL/servers/publicNetworkAccess",
        "notequals": "Disabled"
      }
    ]
  },
  "then": {
    "effect": "Deny"
  }
}
POLICYRULE


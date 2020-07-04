policyDefinition_deny_publicendpoint_sql_policyrule = <<POLICYRULE
{
  "if": {
    "allof": [
      {
        "field": "type",
        "equals": "Microsoft.Sql/servers"
      },
      {
        "field": "Microsoft.Sql/servers/publicNetworkAccess",
        "notequals": "Disabled"
      }
    ]
  },
  "then": {
    "effect": "Deny"
  }
}
POLICYRULE


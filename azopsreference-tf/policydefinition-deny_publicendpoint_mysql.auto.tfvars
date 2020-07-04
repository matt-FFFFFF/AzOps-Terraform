policyDefinition_deny_publicendpoint_mysql_policyrule = <<POLICYRULE
{
  "if": {
    "allof": [
      {
        "field": "type",
        "equals": "Microsoft.DBforMySQL/servers"
      },
      {
        "field": "Microsoft.DBforMySQL/servers/publicNetworkAccess",
        "notequals": "Disabled"
      }
    ]
  },
  "then": {
    "effect": "Deny"
  }
}
POLICYRULE


policyDefinition_deny_publicendpoint_mariadb_policyrule = <<POLICYRULE
{
  "if": {
    "allof": [
      {
        "field": "type",
        "equals": "Microsoft.DBforMariaDB/servers"
      },
      {
        "field": "Microsoft.DBforMariaDB/servers/publicNetworkAccess",
        "notequals": "Disabled"
      }
    ]
  },
  "then": {
    "effect": "Deny"
  }
}
POLICYRULE


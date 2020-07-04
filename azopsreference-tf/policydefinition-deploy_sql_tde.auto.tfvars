policydefinition_deploy_sql_tde_policyrule = <<POLICYRULE
{
  "if": {
    "field": "type",
    "equals": "Microsoft.Sql/servers/databases"
  },
  "then": {
    "effect": "deployIfNotExists",
    "details": {
      "type": "Microsoft.Sql/servers/databases/transparentDataEncryption",
      "existencecondition": {
        "allof": [
          {
            "field": "Microsoft.Sql/transparentDataEncryption.status",
            "equals": "Enabled"
          }
        ]
      },
      "deployment": {
        "properties": {
          "mode": "incremental",
          "template": {
            "$schema": "http://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
            "contentversion": "1.0.0.0",
            "parameters": {
              "location": {
                "type": "string"
              },
              "sqlservername": {
                "type": "string"
              },
              "sqlserverdatabasename": {
                "type": "string"
              }
            },
            "variables": {},
            "resources": [
              {
                "name": "[concat( parameters('sqlServerName'),'/',parameters('sqlServerDataBaseName'),'/current')]",
                "type": "Microsoft.Sql/servers/databases/transparentDataEncryption",
                "apiversion": "2014-04-01",
                "properties": {
                  "status": "Enabled"
                }
              }
            ],
            "outputs": {}
          },
          "parameters": {
            "location": {
              "value": "[field('location')]"
            },
            "sqlservername": {
              "value": "[first(split(field('fullname'),'/'))]"
            },
            "sqlserverdatabasename": {
              "value": "[field('name')]"
            }
          }
        }
      },
      "roledefinitionids": [
        "/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c"
      ]
    }
  }
}
POLICYRULE


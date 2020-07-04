policydefinition_deploy_sql_auditingsettings_policyrule = <<POLICYRULE
{
  "if": {
    "field": "type",
    "equals": "Microsoft.Sql/servers/databases"
  },
  "then": {
    "effect": "deployIfNotExists",
    "details": {
      "type": "Microsoft.Sql/servers/databases/auditingSettings",
      "name": "default",
      "existencecondition": {
        "allof": [
          {
            "field": "Microsoft.Sql/servers/databases/auditingSettings/state",
            "equals": "enabled"
          },
          {
            "field": "Microsoft.Sql/servers/databases/auditingSettings/isAzureMonitorTargetEnabled",
            "equals": "true"
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
                "name": "[concat( parameters('sqlServerName'),'/',parameters('sqlServerDataBaseName'),'/default')]",
                "type": "Microsoft.Sql/servers/databases/auditingSettings",
                "apiversion": "2017-03-01-preview",
                "properties": {
                  "state": "enabled",
                  "auditactionsandgroups": [
                    "BATCH_COMPLETED_GROUP",
                    "DATABASE_OBJECT_CHANGE_GROUP",
                    "SCHEMA_OBJECT_CHANGE_GROUP",
                    "BACKUP_RESTORE_GROUP",
                    "APPLICATION_ROLE_CHANGE_PASSWORD_GROUP",
                    "DATABASE_PRINCIPAL_CHANGE_GROUP",
                    "DATABASE_PRINCIPAL_IMPERSONATION_GROUP",
                    "DATABASE_ROLE_MEMBER_CHANGE_GROUP",
                    "USER_CHANGE_PASSWORD_GROUP",
                    "DATABASE_OBJECT_OWNERSHIP_CHANGE_GROUP",
                    "DATABASE_OBJECT_PERMISSION_CHANGE_GROUP",
                    "DATABASE_PERMISSION_CHANGE_GROUP",
                    "SCHEMA_OBJECT_PERMISSION_CHANGE_GROUP",
                    "SUCCESSFUL_DATABASE_AUTHENTICATION_GROUP",
                    "FAILED_DATABASE_AUTHENTICATION_GROUP"
                  ],
                  "isazuremonitortargetenabled": true
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


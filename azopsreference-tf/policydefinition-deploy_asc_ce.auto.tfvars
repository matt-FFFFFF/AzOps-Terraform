policyDefinition_deploy_asc_ce_policyrule = <<POLICYRULE
{
  "if": {
    "field": "type",
    "equals": "Microsoft.Resources/subscriptions"
  },
  "then": {
    "effect": "deployIfNotExists",
    "details": {
      "type": "Microsoft.Security/automations",
      "name": "ExportToWorkspace",
      "existencescope": "resourcegroup",
      "resourcegroupname": "[concat(subscription().displayName, '-asc')]",
      "deploymentscope": "subscription",
      "roledefinitionids": [
        "/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c"
      ],
      "deployment": {
        "location": "northeurope",
        "properties": {
          "mode": "incremental",
          "template": {
            "$schema": "https://schema.management.azure.com/schemas/2018-05-01/subscriptionDeploymentTemplate.json#",
            "contentversion": "1.0.0.0",
            "parameters": {
              "resourcegrouplocation": {
                "type": "string"
              },
              "exporteddatatypes": {
                "type": "array"
              },
              "recommendationnames": {
                "type": "array"
              },
              "recommendationseverities": {
                "type": "array"
              },
              "alertseverities": {
                "type": "array"
              },
              "workspaceresourceid": {
                "type": "string"
              },
              "subscriptionazureresourceid": {
                "type": "string"
              },
              "subscriptionid": {
                "type": "string"
              }
            },
            "variables": {
              "resourcegroupname": "[concat(subscription().displayName, '-asc')]",
              "scopedescription": "scope for subscription {0}",
              "recommendationnameslength": "[length(parameters('recommendationNames'))]",
              "recommendationseveritieslength": "[length(parameters('recommendationSeverities'))]",
              "alertseveritieslength": "[length(parameters('alertSeverities'))]",
              "recommendationnameslengthifempty": "[if(equals(variables('recommendationNamesLength'), 0), 1, variables('recommendationNamesLength'))]",
              "recommendationseveritieslengthifempty": "[if(equals(variables('recommendationSeveritiesLength'), 0), 1, variables('recommendationSeveritiesLength'))]",
              "alertseveritieslengthifempty": "[if(equals(variables('alertSeveritiesLength'), 0), 1, variables('alertSeveritiesLength'))]",
              "totalrulecombinationsforonerecommendationname": "[variables('recommendationSeveritiesLengthIfEmpty')]",
              "totalrulecombinationsforonerecommendationseverity": 1,
              "exporteddatatypeslength": "[length(parameters('exportedDataTypes'))]",
              "exporteddatatypeslengthifempty": "[if(equals(variables('exportedDataTypesLength'), 0), 1, variables('exportedDataTypesLength'))]",
              "datatypemap": {
                "security recommendations": "Assessments",
                "security alerts": "Alerts"
              },
              "alertseveritymap": {
                "high": "high",
                "medium": "medium",
                "low": "low"
              },
              "rulesetsforassessmentsobj": {
                "copy": [
                  {
                    "name": "ruleSetsForAssessmentsArr",
                    "count": "[mul(variables('recommendationNamesLengthIfEmpty'),variables('recommendationSeveritiesLengthIfEmpty'))]",
                    "input": {
                      "rules": [
                        {
                          "propertyjpath": "[if(equals(variables('recommendationNamesLength'),0),'type','name')]",
                          "propertytype": "string",
                          "expectedvalue": "[if(equals(variables('recommendationNamesLength'),0),'Microsoft.Security/assessments',parameters('recommendationNames')[mod(div(copyIndex('ruleSetsForAssessmentsArr'),variables('totalRuleCombinationsForOneRecommendationName')),variables('recommendationNamesLength'))])]",
                          "operator": "Contains"
                        },
                        {
                          "propertyjpath": "properties.metadata.severity",
                          "propertytype": "string",
                          "expectedvalue": "[parameters('recommendationSeverities')[mod(div(copyIndex('ruleSetsForAssessmentsArr'),variables('totalRuleCombinationsForOneRecommendationSeverity')),variables('recommendationSeveritiesLength'))]]",
                          "operator": "Equals"
                        }
                      ]
                    }
                  }
                ]
              },
              "rulesetsforalertsobj": {
                "copy": [
                  {
                    "name": "ruleSetsForAlertsArr",
                    "count": "[variables('alertSeveritiesLengthIfEmpty')]",
                    "input": {
                      "rules": [
                        {
                          "propertyjpath": "Severity",
                          "propertytype": "string",
                          "expectedvalue": "[variables('alertSeverityMap')[parameters('alertSeverities')[mod(copyIndex('ruleSetsForAlertsArr'),variables('alertSeveritiesLengthIfEmpty'))]]]",
                          "operator": "Equals"
                        }
                      ]
                    }
                  }
                ]
              }
            },
            "resources": [
              {
                "name": "[variables('resourceGroupName')]",
                "type": "Microsoft.Resources/resourceGroups",
                "apiversion": "2019-10-01",
                "location": "[parameters('resourceGroupLocation')]",
                "tags": {},
                "properties": {}
              },
              {
                "type": "Microsoft.Resources/deployments",
                "apiversion": "2019-10-01",
                "name": "nestedAutomationDeployment",
                "resourcegroup": "[variables('resourceGroupName')]",
                "dependson": [
                  "[resourceId('Microsoft.Resources/resourceGroups/', variables('resourceGroupName'))]"
                ],
                "properties": {
                  "mode": "Incremental",
                  "template": {
                    "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
                    "contentversion": "1.0.0.0",
                    "parameters": {},
                    "variables": {},
                    "resources": [
                      {
                        "tags": {},
                        "apiversion": "2019-01-01-preview",
                        "location": "[parameters('resourceGroupLocation')]",
                        "name": "ExportToWorkspace",
                        "type": "Microsoft.Security/automations",
                        "dependson": [],
                        "properties": {
                          "description": "Export Azure Security Center Alerts and/or Recommendations to Log Analytics Workspace via Policy",
                          "isenabled": true,
                          "scopes": [
                            {
                              "description": "[replace(variables('scopeDescription'),'{0}', parameters('subscriptionId'))]",
                              "scopepath": "[parameters('subscriptionAzureResourceId')]"
                            }
                          ],
                          "copy": [
                            {
                              "name": "sources",
                              "count": "[variables('exportedDataTypesLengthIfEmpty')]",
                              "input": {
                                "eventsource": "[variables('dataTypeMap')[parameters('exportedDataTypes')[copyIndex('sources')]]]",
                                "rulesets": "[if(equals(parameters('exportedDataTypes')[copyIndex('sources')], 'Security recommendations'), variables('ruleSetsForAssessmentsObj').ruleSetsForAssessmentsArr, variables('ruleSetsForAlertsObj').ruleSetsForAlertsArr)]"
                              }
                            }
                          ],
                          "actions": [
                            {
                              "actiontype": "Workspace",
                              "workspaceresourceid": "[parameters('workspaceResourceId')]"
                            }
                          ]
                        }
                      }
                    ]
                  }
                }
              }
            ]
          },
          "parameters": {
            "resourcegrouplocation": {
              "value": "[parameters('resourceGroupLocation')]"
            },
            "exporteddatatypes": {
              "value": "[parameters('exportedDataTypes')]"
            },
            "recommendationnames": {
              "value": "[parameters('recommendationNames')]"
            },
            "recommendationseverities": {
              "value": "[parameters('recommendationSeverities')]"
            },
            "alertseverities": {
              "value": "[parameters('alertSeverities')]"
            },
            "workspaceresourceid": {
              "value": "[parameters('workspaceResourceId')]"
            },
            "subscriptionazureresourceid": {
              "value": "[subscription().id]"
            },
            "subscriptionid": {
              "value": "[subscription().subscriptionId]"
            }
          }
        }
      }
    }
  }
}
POLICYRULE

policyDefinition_deploy_asc_ce_parameters = <<PARAMETERS
{
  "resourcegrouplocation": {
    "type": "String",
    "metadata": {
      "displayname": "Resource group location",
      "description": "If you inserted an existing resource group, please select its location. In case this is a new resource group, please choose a location for it",
      "strongtype": "location"
    }
  },
  "exporteddatatypes": {
    "type": "Array",
    "metadata": {
      "displayname": "Exported data types",
      "description": "Choose the data type/s to be exported"
    },
    "allowedvalues": [
      "Security recommendations",
      "Security alerts"
    ],
    "defaultvalue": [
      "Security recommendations",
      "Security alerts"
    ]
  },
  "recommendationnames": {
    "type": "Array",
    "metadata": {
      "displayname": "Recommendation IDs (applicable only for export of security recommendations)",
      "description": "For all recommendations please leave empty. For specific recommendations please insert a list of recommendation IDs separated by ';'. Recommendation IDs are available through Assessments API (https://docs.microsoft.com/en-us/rest/api/securitycenter/assessments), or Azure Resource Graph Explorer (https://ms.portal.azure.com/#blade/HubsExtension/ArgQueryBlade), choose securityresources and microsoft.security/assessments"
    },
    "defaultvalue": []
  },
  "recommendationseverities": {
    "type": "Array",
    "metadata": {
      "displayname": "Recommendation severities (applicable only for export of security recommendations)",
      "description": "To select specific recommendation severities, please untick the appropriate ones"
    },
    "allowedvalues": [
      "High",
      "Medium",
      "Low"
    ],
    "defaultvalue": [
      "High",
      "Medium",
      "Low"
    ]
  },
  "alertseverities": {
    "type": "Array",
    "metadata": {
      "displayname": "Alert severities (applicable only for export of security alerts)",
      "description": "To select specific alert severities, please untick the appropriate ones"
    },
    "allowedvalues": [
      "High",
      "Medium",
      "Low"
    ],
    "defaultvalue": [
      "High",
      "Medium",
      "Low"
    ]
  },
  "workspaceresourceid": {
    "type": "String",
    "metadata": {
      "displayname": "Log Analytics Workspace resource ID",
      "description": "Insert the resource ID of the Log Analytics Workspace for export",
      "strongtype": "omsWorkspace"
    }
  }
}
PARAMETERS


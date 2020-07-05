policydefinition_deny_publicendpoint_aks_policyrule = <<POLICYRULE
{
  "if": {
    "allOf": [
      {
        "field": "type",
        "equals": "Microsoft.ContainerService/managedClusters"
      },
      {
        "field": "Microsoft.ContainerService/managedClusters/apiServerAccessProfile.enablePrivateCluster",
        "notequals": "true"
      }
    ]
  },
  "then": {
    "effect": "Deny"
  }
}
POLICYRULE


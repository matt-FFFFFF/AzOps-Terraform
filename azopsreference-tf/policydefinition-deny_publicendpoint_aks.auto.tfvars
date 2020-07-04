policyDefinition_deny_publicendpoint_aks_policyrule = <<POLICYRULE
{
  "if": {
    "allof": [
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


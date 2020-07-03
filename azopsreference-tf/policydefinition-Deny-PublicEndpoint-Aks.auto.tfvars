policyDefinition-Deny-PublicEndpoint-Aks-policyrule = <<POLICYRULE
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


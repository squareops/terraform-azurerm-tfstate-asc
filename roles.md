## Roles Required

<!-- BEGINNING OF PRE-COMMIT-PIKE DOCS HOOK -->
Permissions required are:

```json
{
  "resourceGroup": [
    "Microsoft.Resources/resourceGroups/write",
    "Microsoft.Resources/resourceGroups/read",
    "Microsoft.Resources/resourceGroups/delete"
  ],
  "storageAccount": [
    "Microsoft.Storage/storageAccounts/write",
    "Microsoft.Storage/storageAccounts/read",
    "Microsoft.Storage/storageAccounts/delete"
  ],
  "storageContainer": [
    "Microsoft.Storage/storageAccounts/blobServices/containers/write",
    "Microsoft.Storage/storageAccounts/blobServices/containers/read",
    "Microsoft.Storage/storageAccounts/blobServices/containers/delete"
  ]
}
```
<!-- END OF PRE-COMMIT-PIKE DOCS HOOK -->
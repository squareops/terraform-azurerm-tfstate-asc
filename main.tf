locals {
  tags = {
    Automation  = "true"
    Environment = "demo"
    Name        = "skaf"
  }
}

data "azuread_client_config" "current" {}

resource "azurerm_resource_group" "resource_group" {
  name     = var.resource_group_name
  location = var.resource_group_location
  tags = local.tags
}

resource "azurerm_key_vault" "key_vault" {
  depends_on = [azurerm_resource_group.resource_group]
  name                        = format("%s-%s-key", local.tags.Environment, local.tags.Name)
  location                    = azurerm_resource_group.resource_group.location
  resource_group_name         = azurerm_resource_group.resource_group.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azuread_client_config.current.tenant_id
  sku_name     = "standard"
  tags = local.tags
}

resource "azurerm_storage_account" "storage_account" {
  depends_on = [azurerm_resource_group.resource_group]
  name                     = format("%s%s", var.storage_account_name, var.environment)
  resource_group_name      = azurerm_resource_group.resource_group.name
  location                 = azurerm_resource_group.resource_group.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = local.tags
}

resource "azurerm_storage_container" "storage_container" {
  name                  = format("%s-%s-container", var.storage_container_name, var.environment)
  storage_account_name  = azurerm_storage_account.storage_account.name
  container_access_type = "private"
  depends_on = [azurerm_storage_account.storage_account]
}

resource "azurerm_log_analytics_workspace" "log_analytics" {
  name                = format("%s-%s-logs-workspace", var.storage_account_name, var.environment)
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  retention_in_days   = 30
  tags = local.tags
}

# data "azurerm_subscription" "primary" {}

# resource "azurerm_management_group" "root" {
#   display_name = "ParentGroup"

#   subscription_ids = [
#     data.azurerm_subscription.primary.subscription_id,
#   ]
# }

# resource "azurerm_role_definition" "role_assignment_contributor" {
#     name  = "Role Assignment Owner"
#     scope = azurerm_management_group.root.id
#     description = "A role designed for writing and deleting role assignments"

#     permissions {
#         actions = [
#             "Microsoft.Authorization/roleAssignments/write",
#             "Microsoft.Authorization/roleAssignments/delete",
#         ]
#         not_actions = []
#     }

#     assignable_scopes = [
#         azurerm_management_group.root.id
#     ]
# }

# resource "azurerm_role_assignment" "role_assignment" {
#   scope                = data.azurerm_subscription.primary.id
#   role_definition_name = "Storage Blob Data Contributor"
#   principal_id         = data.azuread_client_config.current.object_id
#   depends_on = [azurerm_storage_account.storage_account, azurerm_role_definition.role_assignment_contributor]
# }

resource "azurerm_monitor_diagnostic_setting" "diagnostic_setting" {
  name               = format("%s-%s-monitor-diagnostic", var.storage_account_name, var.environment)
  target_resource_id = "${azurerm_storage_account.storage_account.id}/blobServices/default/"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.log_analytics.id

  log {
    category = "StorageRead"
    enabled  = true
  }

  log {
    category = "StorageWrite"
    enabled  = true
  }

  metric {
    category = "AllMetrics"
    enabled  = true
  }

  depends_on = [
    azurerm_log_analytics_workspace.log_analytics,
    # azurerm_role_assignment.role_assignment
  ]

}

# resource "azurerm_storage_account_network_rules" "storage_networkrules" {
#   storage_account_id = azurerm_storage_account.storage_account.id

#   default_action             = "Deny"
#   bypass                     = ["AzureServices"]
#   #virtual_network_subnet_ids = []

#   tags = local.tags
# }

# --- For KMS encryption keys ---

# data "azuread_client_config" "current" {}

# resource "azurerm_key_vault" "kms" {
#   name                        = format("%s-%s-kms", local.name, local.environment)
#   location                    = local.region
#   resource_group_name         = azurerm_resource_group.terraform_backend.name
#   enabled_for_disk_encryption = true
#   tenant_id                   = data.azuread_client_config.current.tenant_id
#   soft_delete_retention_days  = 7
#   purge_protection_enabled    = false

#   sku_name = "standard"

#   access_policy {
#     tenant_id = data.azuread_client_config.current.tenant_id
#     object_id = data.azuread_client_config.current.object_id

#     key_permissions = [
#       "Backup",
#       "Delete",
#       "Get",
#       "List",
#       "Purge",
#       "Recover",
#       "Restore"
#     ]

#     secret_permissions = [
#       "Backup",
#       "Delete",
#       "Get",
#       "List",
#       "Purge",
#       "Recover",
#       "Restore"
#     ]

#     storage_permissions = [
#       "Backup",
#       "Delete",
#       "Get",
#       "List",
#       "Purge",
#       "Recover",
#       "Restore"
#     ]
#   }
# }
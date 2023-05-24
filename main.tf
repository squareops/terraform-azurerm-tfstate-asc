locals {
  tags = {
    Automation  = "true"
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
  name                        = format("%s-%s-key", var.azure_key_vault_name, var.environment)
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

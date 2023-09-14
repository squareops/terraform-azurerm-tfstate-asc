# Create a resource group
resource "azurerm_resource_group" "resource_group" {
  name     = format("%s-%s-tfstate-rg", var.environment, var.resource_group_name)
  location = var.resource_group_location
}

# Create a storage account
resource "azurerm_storage_account" "storage_account" {
  depends_on               = [azurerm_resource_group.resource_group]
  name                     = format("%s%s", var.storage_account_name, var.environment)
  resource_group_name      = azurerm_resource_group.resource_group.name
  location                 = azurerm_resource_group.resource_group.location
  account_tier             = "Standard" # Standard storage account type for blobs, file shares, queues, and tables. Recommended for most scenarios using Azure Storage. If you want support for network file system (NFS) in Azure Files, use the premium file shares account type.
  account_replication_type = "LRS"      # Locally redundant storage (LRS) copies your data synchronously three times within a single physical location in the primary region. LRS is the least expensive replication option, but isn't recommended for applications requiring high availability or durability.
}

# Create a storage container
resource "azurerm_storage_container" "storage_container" {
  depends_on            = [azurerm_storage_account.storage_account]
  name                  = format("%s-%s-container", var.storage_container_name, var.environment)
  storage_account_name  = azurerm_storage_account.storage_account.name
  container_access_type = "private"
}

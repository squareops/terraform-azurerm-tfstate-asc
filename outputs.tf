output "terraform_state_resource_group_name" {
  value = azurerm_resource_group.resource_group.name
}

output "terraform_state_storage_account" {
  value = azurerm_storage_account.storage_account.name
}

output "terraform_state_storage_container_name" {
  value = azurerm_storage_container.storage_container.name
}
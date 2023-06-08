output "terraform_state_resource_group_name" {
  description = "Specify the resource group name in which an Storage account will be created by the module."
  value = azurerm_resource_group.resource_group.name
}

output "terraform_state_storage_account" {
  description = "Specify the storage account name in which an Storage container will be created by the module."
  value = azurerm_storage_account.storage_account.name
}

output "terraform_state_storage_container_name" {
  description = "Specify the storage container name in where tfstate will be stored by the module."
  value = azurerm_storage_container.storage_container.name
}
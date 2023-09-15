output "terraform_state_resource_group_name" {
  description = "Specify the resource group name in which an Storage account will be created by the module."
  value       = module.backend.terraform_state_resource_group_name
}

output "terraform_state_storage_account" {
  description = "Specify the storage account name in which an Storage container will be created by the module."
  value       = module.backend.terraform_state_storage_account
}

output "terraform_state_storage_container_name" {
  description = "Specify the storage container name in where tfstate will be stored by the module."
  value       = module.backend.terraform_state_storage_container_name
}

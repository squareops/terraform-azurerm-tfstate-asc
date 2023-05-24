output "terraform_state_resource_group_name" {
  value = module.backend.terraform_state_resource_group_name
}

output "terraform_state_storage_account" {
  value = module.backend.terraform_state_storage_account
}

output "terraform_state_storage_container_name" {
  value = module.backend.terraform_state_storage_container_name
}

output "kms_tenant_id" {
  value = module.backend.kms_tenant_id
}

output "kms_object_id" {
  value = module.backend.kms_object_id
}
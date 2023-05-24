variable "resource_group_name" {
  description = "Name of the resource group to be created."
  default = "skaf"
  type    = string
}

variable "resource_group_location" {
  description = "Name of the resource group location to be created."
  default = "East US"
  type    = string
}

variable "storage_account_name" {
  description = "Name of the Storage account to be created."
  default = "skaf"
  type    = string
}

variable "storage_container_name" {
  description = "Name of the storage container to be created."
  default = "skaf"
  type    = string
}

variable "azure_key_vault_name" {
  description = "Name of the key to be created."
  default = "skaf"
  type    = string
}

variable "force_destroy" {
  description = "Whether or not to delete all objects from the storage to allow for destruction of the bucket without error."
  default     = false
  type        = bool
}

variable "logging" {
  description = "Configuration for storage container access logging."
  default     = true
  type        = bool
}

variable "environment" {
  description = "Specify the type of environment(dev, demo, prod) in which the storage account will be created. "
  default     = "demo"
  type        = string
}
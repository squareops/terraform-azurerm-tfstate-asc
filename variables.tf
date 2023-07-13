variable "resource_group_name" {
  description = "Name of the resource group to be created."
  default     = ""
  type        = string
}

variable "resource_group_location" {
  description = "Name of the resource group location to be created."
  default     = ""
  type        = string
}

variable "storage_account_name" {
  description = "Name of the Storage account to be created."
  default     = ""
  type        = string
}

variable "storage_container_name" {
  description = "Name of the storage container to be created."
  default     = ""
  type        = string
}

variable "environment" {
  description = "Specify the type of environment(dev, demo, prod) in which the storage account will be created."
  default     = ""
  type        = string
}
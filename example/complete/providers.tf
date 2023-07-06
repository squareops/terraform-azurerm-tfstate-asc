provider "azurerm" {
  features {}
}

locals {
    additional_tags = {
    Owner      = "organization_name"
    Expires    = "Never"
    Department = "Engineering"
  }
}
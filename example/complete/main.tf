locals {
  region      = "East US"
  environment = "demo"
  name        = "skaf"
  additional_tags = {
    Owner      = "organization_name"
    Expires    = "Never"
    Department = "Engineering"
  }
}

module "backend" {
  source                    = "../../"
  resource_group_name       = local.name
  storage_account_name      = local.name
  storage_container_name    = "tfstate-container" # unique storage container name
  azure_key_vault_name      = local.name
  resource_group_location   = local.region
  environment               = local.environment
}
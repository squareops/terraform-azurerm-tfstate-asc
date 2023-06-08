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
  source                                = "squareops/tfstate/azure"
  resource_group_name                   = local.name
  storage_account_name                  = local.name
  storage_container_name                = "tfstate" # unique storage container name
  resource_group_location               = local.region
  environment                           = local.environment
}
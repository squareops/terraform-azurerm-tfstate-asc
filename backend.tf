# terraform {
#   backend "azurerm" {
#     resource_group_name  = "skaf-demo-tfbackend-rg"
#     storage_account_name = "skafdemotfbackend"
#     container_name       = "skaf-demo-tfbackend-sc"
#     key                  = "skaf-terraform-infra/vnet.tfstate"
#   }
# }
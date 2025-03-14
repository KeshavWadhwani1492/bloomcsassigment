provider "azurerm" {
  features {}

  subscription_id = "----"
  client_id       = "----"
  client_secret   = "-----"
  tenant_id       = "-----"



}

terraform {
  backend "azurerm" {
    resource_group_name   = "rg-terraform-state"
    storage_account_name  = "kwterraformstate"
    container_name        = "tfstate"
    key                   = "webapp-Prod.tfstate"
  }
}


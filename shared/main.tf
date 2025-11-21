terraform {
  backend "azurerm" {
    resource_group_name  = "rg-tfstate"
    storage_account_name = "stctktfstateprod"
    container_name       = "tfstate"
    key                  = "shared.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

module "shared_resource_group" {
  source           = "../modules/resource_group"
  project_name     = var.project_name
  region_name      = var.region_name
  environment_name = "shared"
}

module "shared_container_registry" {
  source              = "../modules/container_registry"
  resource_group_name = module.shared_resource_group.name
  project_name        = var.project_name
  environment_name    = "shared"
  region_name         = var.region_name
  acr_sku             = var.acr_sku
}

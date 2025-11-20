terraform {
  backend "azurerm" {
    resource_group_name  = "rg-tfstate"
    storage_account_name = "stctktfstateprod"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

module "dev_environment" {
  source = "../modules/environment"

  project_name             = var.project_name
  environment_name         = "dev"
  region_name              = var.region_name
  database_name            = "ctk"
  acr_sku                  = "Basic" 
  webapp_image_tag         = var.webapp_image_tag
  cloai_service_image_tag  = var.cloai_service_image_tag
  ctk_functions_image_tag  = var.ctk_functions_image_tag
  cloai_model              = var.cloai_model
}


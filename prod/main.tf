terraform {
  backend "azurerm" {
    resource_group_name  = "rg-tfstate"
    storage_account_name = "stctktfstateprod"
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

data "terraform_remote_state" "shared" {
  backend = "azurerm"
  config = {
    resource_group_name  = "rg-tfstate"
    storage_account_name = "stctktfstateprod"
    container_name       = "tfstate"
    key                  = "shared.terraform.tfstate"
  }
}

module "prod_environment" {
  source = "../modules/environment"

  project_name             = var.project_name
  environment_name         = "prod"
  region_name              = var.region_name
  database_name            = "ctk"
  acr_id                   = data.terraform_remote_state.shared.outputs.acr_id
  acr_login_server         = data.terraform_remote_state.shared.outputs.acr_login_server
  webapp_image_tag         = var.webapp_image_tag
  cloai_service_image_tag  = var.cloai_service_image_tag
  ctk_functions_image_tag  = var.ctk_functions_image_tag
  cloai_model              = var.cloai_model
  azure_ad_client_id       = var.azure_ad_client_id
  azure_ad_tenant_id       = var.azure_ad_tenant_id
}


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

  project_name            = var.project_name
  environment_name        = "prod"
  region_name             = var.region_name
  acr_id                  = data.terraform_remote_state.shared.outputs.acr_id
  acr_login_server        = data.terraform_remote_state.shared.outputs.acr_login_server
  acr_admin_username      = data.terraform_remote_state.shared.outputs.acr_admin_username
  acr_admin_password      = data.terraform_remote_state.shared.outputs.acr_admin_password
  webapp_image_tag        = var.webapp_image_tag
  cloai_service_image_tag = var.cloai_service_image_tag
  ctk_functions_image_tag = var.ctk_functions_image_tag
  cloai_model             = var.cloai_model
  ad_redirect_uris        = ["https://cliniciantoolkit.childmind.org/.auth/login/aad/callback"]
}


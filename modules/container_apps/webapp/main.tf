resource "azurerm_container_app" "webapp" {
  name                         = format("ca-ctk-webapp-%s-%s", var.project_name, var.environment_name)
  container_app_environment_id = var.container_app_environment_id
  resource_group_name          = var.resource_group_name
  revision_mode                = "Single"

  ingress {
    external_enabled = true
    target_port      = 8000
    traffic_weight {
      percentage      = 100
      latest_revision = true
    }
  }

  template {
    container {
      name   = format("ca-ctk-webapp-%s-%s", var.project_name, var.environment_name)
      image  = "${var.acr_login_server}/ctk-webapp:${var.image_tag}"
      cpu    = 1
      memory = "2Gi"

      env {
        name  = "LANGUAGETOOL_URL"
        value = var.languagetool_url
      }

      env {
        name  = "POSTGRES_HOST"
        value = var.postgres_host
      }

      env {
        name  = "POSTGRES_PORT"
        value = var.postgres_port
      }

      env {
        name  = "POSTGRES_DB"
        value = var.postgres_db
      }

      env {
        name  = "POSTGRES_USER"
        value = var.postgres_user
      }

      env {
        name  = "POSTGRES_PASSWORD"
        value = var.postgres_password
      }

      env {
        name  = "AZURE_BLOB_ACCOUNT_NAME"
        value = var.azure_blob_account_name
      }

      env {
        name = "BODY_SIZE_LIMIT"
        value = "5M"
      }
    }
  }
}

// AzureRM does not yet support configuring Authentication for Container Apps,
// so we use the azapi provider to do this.
// C.f. https://github.com/hashicorp/terraform-provider-azurerm/issues/22213
resource "azapi_resource_action" "my_app_auth" {
  type        = "Microsoft.App/containerApps/authConfigs@2024-03-01"
  resource_id = "${azurerm_container_app.webapp.id}/authConfigs/current"
  method      = "PUT"

  body = jsonencode({
    location = azurerm_resource_group.ev_rg.location
    properties = {
      globalValidation = {
        redirectToProvider          = "azureactivedirectory"
        unauthenticatedClientAction = "RedirectToLoginPage"
      }
      identityProviders = {
        azureActiveDirectory = {
          registration = {
            clientId                = var.azure_ad_client_id
            clientSecretSettingName = "microsoft-provider-authentication-secret"
            openIdIssuer            = "https://sts.windows.net/${var.azure_ad_tenant_id}/v2.0"
          }
          validation = {
            defaultAuthorizationPolicy = {
              allowedApplications = [
                var.azure_ad_client_id,
              ]
            }
          }
        }
      }
      platform = {
        enabled = true
      }
    }
  })
}
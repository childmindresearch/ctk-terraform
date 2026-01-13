resource "azurerm_user_assigned_identity" "webapp_identity" {
  name                = format("id-%s-%s-webapp", var.project_name, var.environment_name)
  resource_group_name = var.resource_group_name
  location            = var.region_name

  tags = {
    environment = var.environment_name
    project     = var.project_name
  }
}

resource "azurerm_role_assignment" "webapp_acr_pull" {
  scope                = var.acr_id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_user_assigned_identity.webapp_identity.principal_id
}

resource "azurerm_container_app" "webapp" {
  name                         = format("ca-%s-%s-webapp", var.project_name, var.environment_name)
  container_app_environment_id = var.container_app_environment_id
  resource_group_name          = var.resource_group_name
  revision_mode                = "Single"

  tags = {
    environment = var.environment_name
    project     = var.project_name
  }

  ingress {
    external_enabled = true
    target_port      = 3000
    traffic_weight {
      percentage      = 100
      latest_revision = true
    }
  }

  depends_on = [azurerm_role_assignment.webapp_acr_pull]

  lifecycle {
    ignore_changes = [
      ingress[0].custom_domain
    ]
  }

  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.webapp_identity.id]
  }

  registry {
    server               = var.acr_login_server
    username             = var.acr_admin_username
    password_secret_name = "acr-admin-password"
  }

  secret {
    name  = "acr-admin-password"
    value = var.acr_admin_password
  }

  secret {
    name  = "microsoft-provider-authentication-secret"
    value = var.azure_ad_client_secret
  }

  template {
    container {
      name   = format("ca-%s-%s-webapp", var.project_name, var.environment_name)
      image  = "${var.acr_login_server}/childmindresearch/ctk-webapp:${var.image_tag}"
      cpu    = 1
      memory = "2Gi"

      env {
        name  = "AZURE_FUNCTION_PYTHON_URL"
        value = var.ctk_functions_url
      }

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
        name  = "BODY_SIZE_LIMIT"
        value = "5M"
      }

      env {
        name  = "APPLICATIONINSIGHTS_CONNECTION_STRING"
        value = var.application_insights_connection_string
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

  body = {
    location = var.region_name
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
  }
}

resource "azapi_resource" "managed_cert" {
  type      = "Microsoft.App/managedEnvironments/managedCertificates@2024-03-01"
  parent_id = var.container_app_environment_id
  name      = format("cert-%s-%s", var.project_name, var.environment_name)
  location  = var.region_name

  body = {
    properties = {
      subjectName             = var.custom_domain
      domainControlValidation = "CNAME"
    }
  }
}

resource "azapi_update_resource" "webapp_bind_domain" {
  type        = "Microsoft.App/containerApps@2024-03-01"
  resource_id = azurerm_container_app.webapp.id

  body = {
    properties = {
      configuration = {
        secrets = [
          {
            name  = "acr-admin-password"
            value = var.acr_admin_password
          },
          {
            name  = "microsoft-provider-authentication-secret"
            value = var.azure_ad_client_secret
          }
        ]

        ingress = {
          customDomains = [
            {
              name          = var.custom_domain
              bindingType   = "SniEnabled"
              certificateId = azapi_resource.managed_cert.id
            }
          ]
        }
      }
    }
  }

  depends_on = [azapi_resource.managed_cert]
}

resource "azurerm_container_app" "ctk_functions" {
  name                         = format("ca-ctk-functions-%s-%s", var.project_name, var.environment_name)
  container_app_environment_id = var.container_app_environment_id
  resource_group_name          = var.resource_group_name
  revision_mode                = "Single"

  ingress {
    external_enabled = false
    target_port      = 8000
    traffic_weight {
      percentage      = 100
      latest_revision = true
    }
  }

  identity {
    type = "SystemAssigned"
  }

  template {
    container {
      name   = format("ca-ctk-functions-%s-%s", var.project_name, var.environment_name)
      image  = "${var.acr_login_server}/ctk-functions:${var.image_tag}"
      cpu    = 1
      memory = "2Gi"

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
        name  = "CLOAI_MODEL"
        value = var.cloai_model
      }

      env {
        name  = "CLOAI_SERVICE_URL"
        value = var.cloai_service_url
      }

      env {
        name  = "LANGUAGETOOL_URL"
        value = var.languagetool_url
      }

      env {
        name        = "REDCAP_API_TOKEN"
        secret_name = "redcap-api-token"
      }

      env {
        name        = "AZURE_BLOB_CONNECTION_STRING"
        secret_name = "azure-blob-connection-string"
      }
    }
  }

  secret {
    name                = "redcap-api-token"
    key_vault_secret_id = var.redcap_api_token_secret_id
    identity            = "System"
  }

  secret {
    name                = "azure-blob-connection-string"
    key_vault_secret_id = var.azure_blob_connection_string_secret_id
    identity            = "System"
  }
}

resource "azurerm_role_assignment" "ctk_functions_kv_secrets_user" {
  scope                = var.key_vault_id
  role_definition_name = "Key Vault Secrets User"
  principal_id         = azurerm_container_app.ctk_functions.identity[0].principal_id
}

resource "azurerm_role_assignment" "ctk_functions_acr_pull" {
  scope                = var.acr_id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_container_app.ctk_functions.identity[0].principal_id
}

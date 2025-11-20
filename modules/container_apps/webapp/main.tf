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

resource "azurerm_container_app" "cloai_service" {
  name                         = format("ca-cloai-service-%s-%s", var.project_name, var.environment_name)
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
      name   = format("ca-cloai-service-%s-%s", var.project_name, var.environment_name)
      image  = "${var.acr_login_server}/cloai-service:${var.image_tag}"
      cpu    = 1
      memory = "2Gi"

      env {
        name  = "WEB_CONCURRENCY"
        value = "4"
      }

      env {
        name      = "CONFIG_JSON"
        secret_name = "config-json"
      }
    }
  }

  secret {
    name                = "config-json"
    key_vault_secret_id = var.config_json_secret_id
    identity            = "System"
  }
}

resource "azurerm_role_assignment" "cloai_kv_secrets_user" {
  scope                = var.key_vault_id
  role_definition_name = "Key Vault Secrets User"
  principal_id         = azurerm_container_app.cloai_service.identity[0].principal_id
}

resource "azurerm_role_assignment" "cloai_acr_pull" {
  scope                = var.acr_id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_container_app.cloai_service.identity[0].principal_id
}

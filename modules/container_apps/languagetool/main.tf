resource "azurerm_container_app" "languagetool" {
  name                         = format("ca-ctk-languagetool-%s-%s", var.project_name, var.environment_name)
  container_app_environment_id = var.container_app_environment_id
  resource_group_name          = var.resource_group_name
  revision_mode                = "Single"

  ingress {
    external_enabled = false
    target_port      = 8010
    traffic_weight {
      percentage      = 100
      latest_revision = true
    }
  }

  template {
    container {
      name   = format("ca-ctk-languagetool-%s-%s", var.project_name, var.environment_name)
      image  = "erikvl87/languagetool:6.5"
      cpu    = 1
      memory = "2Gi"
    }
  }
}

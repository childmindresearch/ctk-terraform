data "azuread_client_config" "current" {}

resource "azuread_application" "app" {
  display_name = var.display_name
  owners       = [data.azuread_client_config.current.object_id]

  web {
    redirect_uris = var.redirect_uris
    implicit_grant {
      access_token_issuance_enabled = false
      id_token_issuance_enabled     = true
    }
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "azuread_service_principal" "sp" {
  client_id                    = azuread_application.app.client_id
  owners                       = [data.azuread_client_config.current.object_id]
  app_role_assignment_required = true

  lifecycle {
    prevent_destroy = true
  }
}

resource "azuread_application_password" "secret" {
  application_id = azuread_application.app.id

  lifecycle {
    prevent_destroy = true
  }
}

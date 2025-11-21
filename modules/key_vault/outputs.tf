output "id" {
  value       = azurerm_key_vault.kv.id
  description = "The ID of the Key Vault."
}

output "name" {
  value       = azurerm_key_vault.kv.name
  description = "The name of the Key Vault."
}

output "vault_uri" {
  value       = azurerm_key_vault.kv.vault_uri
  description = "The URI of the Key Vault."
}

output "terraform_role_assignment_id" {
  value       = azurerm_role_assignment.terraform_kv_secrets_officer.id
  description = "The ID of the role assignment for the Terraform service principal."
}

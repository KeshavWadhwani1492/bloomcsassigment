output "keyvault_id" {
  description = "The ID of the created Key Vault."
  value       = azurerm_key_vault.main.id
}

output "keyvault_uri" {
  description = "The URI of the created Key Vault."
  value       = azurerm_key_vault.main.vault_uri
}


output "db_connection_id" {
  description = "The URI of the created Key Vault."
  value       = azurerm_key_vault_secret.db_connection_string.id
}
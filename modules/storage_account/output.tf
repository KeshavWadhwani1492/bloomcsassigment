output "storage_account_id" {
  description = "The ID of the created Storage Account."
  value       = azurerm_storage_account.main.id
}

output "storage_account_primary_web_endpoint" {
  description = "The primary web endpoint of the Storage Account."
  value       = azurerm_storage_account.main.primary_web_endpoint
}

output "storage_account_name" {
  description = "The primary web endpoint of the Storage Account."
  value       = azurerm_storage_account.main.name
}

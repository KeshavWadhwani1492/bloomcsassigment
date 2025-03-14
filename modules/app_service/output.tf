output "app_service_id" {
  description = "The ID of the created App Service."
  value       = azurerm_linux_web_app.main.id
}

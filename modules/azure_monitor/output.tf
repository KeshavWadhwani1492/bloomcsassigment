output "diagnostic_setting_id" {
  description = "The ID of the created Diagnostic Setting."
  value       = azurerm_monitor_diagnostic_setting.main.id
}

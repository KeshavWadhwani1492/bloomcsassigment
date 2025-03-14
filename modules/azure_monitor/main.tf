resource "azurerm_monitor_diagnostic_setting" "main" {
  name                           = var.diagnostic_setting_name
  target_resource_id             = var.target_resource_id
  log_analytics_workspace_id     = var.log_analytics_workspace_id
  metric {
    category = "AllMetrics"
  }
enabled_log {
    category = "AppServiceAppLogs"
  }
}

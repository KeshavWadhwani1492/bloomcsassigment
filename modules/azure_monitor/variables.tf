variable "diagnostic_setting_name" {
  description = "The name of the diagnostic setting."
  type        = string
}

variable "target_resource_id" {
  description = "The resource ID of the target resource to be monitored."
  type        = string
}

variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics workspace for storing logs."
  type        = string
}

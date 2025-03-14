variable "app_service_plan_name" {
  description = "The name of the App Service Plan."
  type        = string
}

variable "api_app_name" {
  description = "The name of the API App."
  type        = string
}

variable "resource_group_name" {
  description = "The resource group in which to create the App Service."
  type        = string
}

variable "location" {
  description = "The location where the App Service should be created."
  type        = string
}

variable "db_connection_id" {
  description = "The db connection id to connect database."
  type        = string
}

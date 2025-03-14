variable "location" {
  description = "The Azure region where resources will be deployed."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "keyvault_name" {
  description = "The name of the Key Vault."
  type        = string
}

variable "sql_server_name" {
  description = "The name of the SQL Server."
  type        = string
}

variable "sql_database_name" {
  description = "The name of the SQL Database."
  type        = string
}

variable "admin_username" {
  description = "The admin username for the SQL Server."
  type        = string
}


variable "app_service_plan_name" {
  description = "The name of the App Service Plan."
  type        = string
}

variable "api_app_name" {
  description = "The name of the API App."
  type        = string
}

variable "storage_account_name" {
  description = "The name of the Storage Account."
  type        = string
}

variable "cdn_profile_name" {
  description = "The name of the CDN Profile."
  type        = string
}

variable "cdn_endpoint_name" {
  description = "The name of the CDN Endpoint."
  type        = string
}

variable "diagnostic_setting_name" {
  description = "The name of the diagnostic setting."
  type        = string
}


variable "environment" {
  description = "The name of the environment."
  type        = string
}
variable "keyvault_name" {
  description = "The name of the Key Vault."
  type        = string
}

variable "location" {
  description = "The location where the Key Vault should be created."
  type        = string
}

variable "resource_group_name" {
  description = "The resource group in which to create the Key Vault."
  type        = string
}

variable "admin_username" {
  description = "The administrator username for the SQL Server."
  type        = string
}

variable "admin_password" {
  description = "The administrator password for the SQL Server."
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

variable "app_service_principal_id" {
  description = "The name of app service principal id"
  type        = string
}

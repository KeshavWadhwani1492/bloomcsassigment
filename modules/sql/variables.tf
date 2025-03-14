variable "sql_server_name" {
  description = "The name of the SQL Server."
  type        = string
}

variable "sql_database_name" {
  description = "The name of the SQL Database."
  type        = string
}

variable "resource_group_name" {
  description = "The resource group in which to create the SQL Database."
  type        = string
}

variable "location" {
  description = "The location where the SQL Database should be created."
  type        = string
}

variable "admin_username" {
  description = "The administrator username for the SQL Server."
  type        = string
}



output "sql_server_id" {
  description = "The ID of the created SQL Server."
  value       = azurerm_mssql_server.main.id
}

output "sql_database_id" {
  description = "The ID of the created SQL Database."
  value       = azurerm_mssql_database.main.id
}

output "sql_server_name"{
  description = "The Name of the created SQL Server."
  value       = azurerm_mssql_server.main.name
}

output "sql_database_name"{
  description = "The Name of the created database."
  value       = azurerm_mssql_database.main.name
}

output "sql_database_password"{
description = "The Name of the created database."
  value       = random_password.db_admin_password.result
  sensitive = true
}
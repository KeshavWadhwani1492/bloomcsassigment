
# random_password resource to generate the password
resource "random_password" "db_admin_password" {
  length  = 16
  special = true
  upper   = true
  lower   = true
}

resource "azurerm_mssql_server" "main" {
  name                         = var.sql_server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.admin_username
  administrator_login_password = random_password.db_admin_password.result  # Use random password here
  minimum_tls_version          = "1.2"

  # Disable public access by setting the firewall rule
  public_network_access_enabled = false
}

resource "azurerm_mssql_database" "main" {
  name                = var.sql_database_name
  server_id         = azurerm_mssql_server.main.id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = 2
  sku_name     = "S0"
  enclave_type = "VBS"
  
# prevent the possibility of accidental data loss
  lifecycle {
    prevent_destroy = true
  }


}

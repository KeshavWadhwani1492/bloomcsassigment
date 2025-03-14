data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "main" {
  name                = var.keyvault_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name                 = "premium"
  tenant_id = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7

    network_acls {
    bypass = "AzureServices"
    default_action = "Deny"

    ip_rules = []
    virtual_network_subnet_ids = []
  }
}

resource "azurerm_key_vault_access_policy" "main" {
  key_vault_id = azurerm_key_vault.main.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = var.app_service_principal_id

 secret_permissions = [
      "Get",
      "List"
    ]
}

resource "azurerm_key_vault_secret" "db_connection_string" {
  name         = "db-connection-string"
  value        = "Server=tcp:${var.sql_server_name}.database.windows.net;Database=${var.sql_database_name};User Id=${var.admin_username};Password=${var.admin_password};"
  key_vault_id = azurerm_key_vault.main.id
}

resource "azurerm_role_assignment" "key_vault_secret_access" {
  principal_id   = var.app_service_principal_id
  role_definition_name = "Secret Reader"
  scope           = azurerm_key_vault.main.id
}



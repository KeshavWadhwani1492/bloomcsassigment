resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

module "keyvault" {
  source             = "./modules/keyvault"
  keyvault_name      = var.keyvault_name
  location           = var.location
  resource_group_name = azurerm_resource_group.main.name
  admin_username     = module.sql.sql_server_name
  admin_password     = module.sql.sql_database_password
  sql_server_name    = module.sql.sql_server_name
  sql_database_name  = module.sql.sql_database_name
  app_service_principal_id = module.app_service.app_service_id
}

module "sql" {
  source             = "./modules/sql"
  sql_server_name    = var.sql_server_name
  sql_database_name  = var.sql_database_name
  location           = var.location
  resource_group_name = azurerm_resource_group.main.name
  admin_username     = var.admin_username
}

module "app_service" {
  source               = "./modules/app_service"
  app_service_plan_name = var.app_service_plan_name
  api_app_name         = var.api_app_name
  location             = var.location
  resource_group_name  = azurerm_resource_group.main.name
  db_connection_id = module.keyvault.db_connection_id
  depends_on = [module.sql]
}

module "storage_account" {
  source               = "./modules/storage_account"
  storage_account_name = var.storage_account_name
  location             = var.location
  resource_group_name  = azurerm_resource_group.main.name
}

module "cdn" {
  source              = "./modules/cdn"
  cdn_profile_name    = var.cdn_profile_name
  cdn_endpoint_name   = var.cdn_endpoint_name
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
  origin_name         = module.storage_account.storage_account_name
  origin_host_name    = module.storage_account.storage_account_primary_web_endpoint
}

module "azure_monitor" {
  source                    = "./modules/azure_monitor"
  diagnostic_setting_name   = var.diagnostic_setting_name
  target_resource_id        = module.app_service.app_service_id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.main.id
}

resource "azurerm_log_analytics_workspace" "main" {
  name                = "prod-law"
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}
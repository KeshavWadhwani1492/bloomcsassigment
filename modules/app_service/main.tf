
resource "azurerm_service_plan" "main" {
  name                     = var.app_service_plan_name
  location                 = var.location
  resource_group_name      = var.resource_group_name
  os_type             = "Linux"
  sku_name            = "P1v2"
}

resource "azurerm_linux_web_app" "main" {
  name                = var.api_app_name
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = azurerm_service_plan.main.id 

  site_config {}

   app_settings = {
    "DATABASE_CONNECTION" = "@Microsoft.KeyVault(SecretUri=${var.db_connection_id})"
  }

    identity {
    type = "SystemAssigned"
  }

  https_only  = true
}






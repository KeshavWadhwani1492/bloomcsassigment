resource "azurerm_storage_account" "main" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier              = "Standard"
  account_replication_type = "LRS"
  
  network_rules {
    default_action = "Deny"

    virtual_network_subnet_ids = []
    ip_rules = []

    bypass = ["AzureServices"] # Allows access for Azure Services, you may remove this if needed
  }
}

resource "azurerm_storage_account_static_website" "main" {
  storage_account_id = azurerm_storage_account.main.id
  index_document     = "index.html"
  error_404_document = "404.html"
}

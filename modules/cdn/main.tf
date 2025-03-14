resource "azurerm_cdn_profile" "main" {
  name                     = var.cdn_profile_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  sku                      = "Standard_Microsoft"
}

resource "azurerm_cdn_endpoint" "main" {
  name                     = var.cdn_endpoint_name
  location                 = var.location
  resource_group_name      = var.resource_group_name
  profile_name             = azurerm_cdn_profile.main.name
  origin {
    name      = var.origin_name
    host_name = var.origin_host_name
  }
}

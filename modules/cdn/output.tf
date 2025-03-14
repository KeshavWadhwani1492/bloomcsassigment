output "cdn_profile_id" {
  description = "The ID of the created CDN Profile."
  value       = azurerm_cdn_profile.main.id
}

output "cdn_endpoint_id" {
  description = "The ID of the created CDN Endpoint."
  value       = azurerm_cdn_endpoint.main.id
}

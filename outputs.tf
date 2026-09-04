output "name" {
  description = "Name of the Azure AI Search service."
  value       = azurerm_search_service.this.name
}

output "id" {
  description = "Resource ID of the Azure AI Search service (private-endpoint target and RBAC scope)."
  value       = azurerm_search_service.this.id
}

output "resource_group_name" {
  description = "Resource group the Azure AI Search service lives in."
  value       = azurerm_search_service.this.resource_group_name
}

output "location" {
  description = "Location of the Azure AI Search service."
  value       = azurerm_search_service.this.location
}

output "endpoint" {
  description = "HTTPS endpoint of the Azure AI Search service (resolves via the private DNS zone when public access is disabled)."
  value       = "https://${azurerm_search_service.this.name}.search.windows.net"
}

output "identity_principal_id" {
  description = "Principal ID of the service's managed identity, or null when no identity is configured — grant this RBAC on the resources the service reads (storage, AI Foundry)."
  value       = try(azurerm_search_service.this.identity[0].principal_id, null)
}

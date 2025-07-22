output "name" {
  value = data.azurerm_search_service.this.name
}

output "id" {
  value = data.azurerm_search_service.this.id
}

output "resource_group_name" {
  value = data.azurerm_search_service.this.resource_group_name
}

output "location" {
  value = data.azurerm_search_service.this.location
}
resource "azapi_resource" "search_semantic_config" {
  for_each  = { for sc in var.semantic_configs : sc.name => sc }
  type      = "Microsoft.Search/searchServices/semanticConfigurations@2023-11-01"
  name      = each.value.name
  parent_id = azurerm_search_service.this.id

  body = jsondecode(templatefile("${path.module}/templates/search_semantic_config.json.tftpl", each.value))
}

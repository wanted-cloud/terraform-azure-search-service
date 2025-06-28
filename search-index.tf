resource "azapi_resource" "search_index" {
  for_each  = { for idx in var.indexes : idx.name => idx }
  type      = "Microsoft.Search/searchServices/indexes@2023-11-01"
  name      = each.value.name
  parent_id = azurerm_search_service.this.id

  body = jsondecode(templatefile("${path.module}/templates/search_index.json.tftpl", {
    name   = each.value.name,
    config = each.value.config
  }))
}

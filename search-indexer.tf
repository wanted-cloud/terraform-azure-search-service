resource "azapi_resource" "search_indexer" {
  for_each  = { for idxr in var.indexers : idxr.name => idxr }
  type      = "Microsoft.Search/searchServices/indexers@2023-11-01"
  name      = each.value.name
  parent_id = azurerm_search_service.this.id

  body = jsondecode(templatefile("${path.module}/templates/search_indexer.json.tftpl", each.value))
}

resource "azapi_resource" "search_datasource" {
  for_each  = { for ds in var.data_sources : ds.name => ds }
  type      = "Microsoft.Search/searchServices/dataSources@2023-11-01"
  name      = each.value.name
  parent_id = azurerm_search_service.this.id

  body = jsondecode(templatefile("${path.module}/templates/search_datasource.json.tftpl", each.value))
}

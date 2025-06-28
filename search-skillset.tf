resource "azapi_resource" "search_skillset" {
  for_each  = { for sk in var.skillsets : sk.name => sk }
  type      = "Microsoft.Search/searchServices/skillsets@2023-11-01"
  name      = each.value.name
  parent_id = azurerm_search_service.this.id

  body = jsondecode(templatefile("${path.module}/templates/search_skillset.json.tftpl", each.value))
}

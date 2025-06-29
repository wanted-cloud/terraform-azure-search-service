resource "restapi_object" "search_indexer" {
  for_each = { for idx in var.indexers : idx.name => idx }

  id_attribute = "name"

  path         = "/indexers"
  query_string = "api-version=2024-07-01"
  data         = templatefile("${path.module}/templates/indexer.tftpl", each.value)

  create_method = "POST"
}
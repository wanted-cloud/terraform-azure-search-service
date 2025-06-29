resource "restapi_object" "search_index" {
  for_each = { for idx in var.indexes : idx.name => idx }

  id_attribute = "name"

  path         = "/indexes"
  query_string = "api-version=2024-07-01"
  data         = templatefile("${path.module}/templates/index.tftpl", each.value)

  create_method = "POST"
}
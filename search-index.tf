resource "restapi_object" "search_index" {
  depends_on = [
    restapi_object.search_datasource,
    restapi_object.search_indexer,
    restapi_object.search_skillset
  ]

  for_each = { for idx in var.indexes : idx.name => idx }

  id_attribute = "name"

  path         = "/indexes"
  query_string = "api-version=2024-07-01"
  data         = templatefile("${path.module}/templates/index.tftpl", { index = each.value })

  create_method = "POST"

  read_data   = ""
  read_method = "GET"
  read_path   = "/indexes('{id}')"

  update_data   = templatefile("${path.module}/templates/index.tftpl", { index = each.value })
  update_path   = "/indexes('{id}')"
  update_method = "PUT"

  destroy_data   = ""
  destroy_method = "DELETE"
  destroy_path   = "/indexes('{id}')"
}
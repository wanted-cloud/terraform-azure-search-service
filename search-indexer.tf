resource "restapi_object" "search_indexer" {
  for_each = { for idx in var.indexers : idx.name => idx }

  depends_on = [
    restapi_object.search_datasource,
    restapi_object.search_skillset
  ]

  id_attribute = "name"

  path         = "/indexers"
  query_string = "api-version=2024-07-01"
  data         = templatefile("${path.module}/templates/indexer.tftpl", { indexer = each.value })

  create_method = "POST"

  read_data   = ""
  read_method = "GET"
  read_path   = "/indexers('{id}')"

  update_data   = templatefile("${path.module}/templates/indexer.tftpl", { indexer = each.value })
  update_path   = "/indexers('{id}')"
  update_method = "PUT"

  destroy_data   = ""
  destroy_method = "DELETE"
  destroy_path   = "/indexers('{id}')"
}
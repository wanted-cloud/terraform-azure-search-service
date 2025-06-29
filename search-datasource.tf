resource "restapi_object" "search_datasource" {
  for_each = { for ds in var.data_sources : ds.name => ds }

  id_attribute = "name"

  path         = "/datasources"
  query_string = "api-version=2024-07-01"
  data         = templatefile("${path.module}/templates/data_source.tftpl", each.value)

  create_method = "POST"

  destroy_data = ""
  destroy_method = "DELETE"
  destroy_path = "/datasources('{id}')"

  read_data = ""
  read_method = "GET"
  read_path = "/datasources('{id}')"
}
resource "restapi_object" "search_skillset" {
  for_each = { for ssts in var.skillsets : ssts.name => ssts }

  id_attribute = "name"

  path         = "/skillsets"
  query_string = "api-version=2024-07-01"
  data         = templatefile("${path.module}/templates/skillset.tftpl", each.value)

  create_method = "POST"

  read_data   = ""
  read_method = "GET"
  read_path   = "/skillsets('{id}')"

  update_data   = templatefile("${path.module}/templates/skillset.tftpl", each.value)
  update_path   = "/skillsets('{id}')"
  update_method = "PUT"

  destroy_data   = ""
  destroy_method = "DELETE"
  destroy_path   = "/skillsets('{id}')"
}

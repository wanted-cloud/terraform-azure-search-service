data "azurerm_storage_account" "this" {
  name                = "examplesaw001"
  resource_group_name = "example-rg"
}

module "template" {
    source = "../.."

    name                = "example-aaiss"
    location             = "North Europe"
    resource_group_name = "example-rg"

    data_sources = [{
      name        = "example-storage-account-source"
      description = "My Storage Account data source-2."
      type        = "azureblob"
      credentials = {
        connectionString = format("DefaultEndpointsProtocol=https;AccountName=%s;AccountKey=%s", data.azurerm_storage_account.this.name, data.azurerm_storage_account.this.primary_access_key)
      }
      container = {
        name  = "container"
      }
    }]
}

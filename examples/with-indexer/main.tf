data "azurerm_storage_account" "this" {
  name                = "examplesaw001"
  resource_group_name = "example-rg"
}

module "template" {
  source = "../.."

  name                = "example-aaiss"
  location             = "North Europe"
  resource_group_name = "example-rg"

  data_sources = [
    {
      name        = "hotels-ds"
      type        = "azureblob"
      credentials = {
        connectionString = format(
          "DefaultEndpointsProtocol=https;AccountName=%s;AccountKey=%s",
          data.azurerm_storage_account.this.name,
          data.azurerm_storage_account.this.primary_access_key
        )
      }
      container = {
        name = "container"
      }
    }
  ]

  indexes = [
    {
      name   = "hotels"
      fields = [
        {
          name       = "hotelId"
          type       = "Edm.String"
          key        = true
          searchable = false
        },
        {
          name       = "description"
          type       = "Edm.String"
          searchable = true
        }
      ]
    }
  ]

  indexers = [
    {
      name            = "hotels-idxr"
      dataSourceName  = "hotels-ds"
      targetIndexName = "hotels"
      schedule = {
        interval = "PT2H"
      }
    }
  ]
}

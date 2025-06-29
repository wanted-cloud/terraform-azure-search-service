data "azurerm_storage_account" "this" {
  name                = "wntdsearchtest"
  resource_group_name = "example-rg"
}

module "template" {
    source = "../.."

    name                = "ass-wntd"
    location             = "North Europe"
    resource_group_name = "example-rg"

   /*data_sources = [
    {
      name        = "my-storage-account"
      description = "My Storage Account data source."
      type        = "azureblob"
      credentials = {
        connectionString = "DefaultEndpointsProtocol=https;AccountName=wntdsearchtest;AccountKey=${data.azurerm_storage_account.this.primary_access_key }"
      }
      container = {
        name  = "container"
      }
    }
  ]*/
}

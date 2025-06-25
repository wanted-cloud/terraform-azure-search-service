module "template" {
    source = "../.."

    name = "azure-search-service"
    location = "North Europe"
    resource_group_name = "example-rg"
}
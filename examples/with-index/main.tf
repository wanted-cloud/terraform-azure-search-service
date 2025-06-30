module "template" {
    source = "../.."

    name                = "example-aaiss"
    location             = "North Europe"
    resource_group_name = "example-rg"

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
}

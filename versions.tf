terraform {
  required_version = ">= 1.9"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=4.20.0"
    }
    restapi = {
      source = "mastercard/restapi"
    }
  }
}

provider "restapi" {
  uri                  = "https://${azurerm_search_service.this.name}.search.windows.net"
  write_returns_object = true
  debug                = true

  headers = {
    "api-key"      = azurerm_search_service.this.primary_key,
    "Content-Type" = "application/json"
  }
}
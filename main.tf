/*
 * # wanted-cloud/terraform-azure-search-service
 *
 * Simple Terraform building block wrapper around Azure AI Search service and related resources. 
 */

resource "azurerm_search_service" "this" {
  name                = var.name
  resource_group_name = data.azurerm_resource_group.this.name
  location            = var.location != "" ? var.location : data.azurerm_resource_group.this.location
  sku                 = var.sku_name

  authentication_failure_mode              = var.authentication_failure_mode
  hosting_mode                             = var.hosting_mode
  customer_managed_key_enforcement_enabled = var.customer_managed_key_enforcement_enabled
  allowed_ips                              = var.allowed_ips
  local_authentication_enabled             = var.local_authentication_enabled
  network_rule_bypass_option               = var.network_rule_bypass_option
  partition_count                          = var.partition_count
  replica_count                            = var.replica_count
  public_network_access_enabled            = var.public_network_access_enabled
  semantic_search_sku                      = var.semantic_search_sku

  dynamic "identity" {
    for_each = var.identity_type != "" ? [var.identity_type] : []
    content {
      type         = identity.value
      identity_ids = var.user_assigned_identity_ids
    }
  }

  tags = merge(local.metadata.tags, var.tags)

}
variable "name" {
  description = "Name of the Azure service plan."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group in which the Azure service plan will be created."
  type        = string
}

variable "location" {
  description = "Location of the resource group in which the Azure service plan will be created, if not set it will be the same as the resource group."
  type        = string
  default     = ""
}

variable "sku_name" {
  description = "Name of the SKU to use for the Azure service plan."
  type        = string
  default     = "basic"
}

variable "hosting_mode" {
  description = "Hosting mode of the Azure service plan."
  type        = string
  default     = "default"

}

variable "customer_managed_key_enforcement_enabled" {
  description = "Enable customer managed key enforcement."
  type        = bool
  default     = false

}

variable "authentication_failure_mode " {
  description = "Authentication failure mode for the Azure service plan."
  type        = string
  default     = "http403"

}

variable "allowed_ips" {
  description = "List of allowed IP addresses for the Azure service plan."
  type        = list(string)
  default     = []
}

variable "local_authentication_enabled" {
  description = "Enable local authentication for the Azure service plan."
  type        = bool
  default     = false

}

variable "network_rule_bypass_option" {
  description = "Network rule bypass option for the Azure service plan."
  type        = string
  default     = "None"

}

variable "partition_count" {
  description = "Number of partitions for the Azure service plan."
  type        = number
  default     = 1

}

variable "public_network_access_enabled" {
  description = "Enable public network access for the Azure service plan."
  type        = bool
  default     = true

}

variable "replica_count" {
  description = "Number of replicas for the Azure service plan."
  type        = number
  default     = 1

}

variable "semantic_search_sku" {
  description = "SKU for semantic search."
  type        = string
  default     = "free"
}

variable "tags" {
  description = "Tags to apply to the Azure service plan."
  type        = map(string)
  default     = {}

}

variable "identity_type" {
  description = "Type of identity to use for the Azure service plan."
  type        = string
  default     = ""
}

variable "user_assigned_identity_ids" {
  description = "List of user assigned identity IDs for the Azure service plan."
  type        = list(string)
  default     = ""
}
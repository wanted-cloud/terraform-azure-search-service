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

variable "authentication_failure_mode" {
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
  default     = true

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
  default     = []
}

variable "data_sources" {
  description = "List of data sources to create in the Azure Search Service."
  type = list(object({
    name        = string
    description = optional(string)
    type        = string
    credentials = object({
      connectionString = string
    })
    container = object({
      name  = string
      query = optional(string)
    })
    dataChangeDetectionPolicy   = optional(any)
    dataDeletionDetectionPolicy = optional(any)
    encryptionKey               = optional(any)
  }))
  default = []
}

variable "skillsets" {
  description = <<EOT
A list of skillset objects for Azure Cognitive Search skillsets. Each object should conform to the API schema:
- name (string, required): The name of the skillset.
- skills (list(object), required): List of skill definitions (see API for structure).
- description (string, optional): Description of the skillset.
- cognitive_services (object, optional): Cognitive services account details.
- encryption_key (object, optional): Encryption key definition.
- index_projections (object, optional): Index projections definition.
- knowledge_store (object, optional): Knowledge store definition.
- etag (string, optional): ETag for concurrency control.
- allow_skillset_debugging (bool, optional): Enable skillset debugging.
EOT
  type = list(object({
    name                     = string
    skills                   = list(any) # Use 'any' for flexibility, or define a detailed object if needed
    description              = optional(string)
    cognitive_services       = optional(any)
    encryption_key           = optional(any)
    index_projections        = optional(any)
    knowledge_store          = optional(any)
    etag                     = optional(string)
    allow_skillset_debugging = optional(bool)
  }))
  default = []
}
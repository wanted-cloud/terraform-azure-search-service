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
  default     = []
}

variable "indexes" {
  description = "List of search indexes to create. Each item should have a 'name', 'fields', and optional index properties. See Azure Search REST API docs for details."
  type = list(object({
    name = string
    fields = list(object({
      name            = string
      type            = string
      key             = optional(bool)
      searchable      = optional(bool)
      filterable      = optional(bool)
      sortable        = optional(bool)
      facetable       = optional(bool)
      retrievable     = optional(bool)
      analyzer        = optional(string)
      search_analyzer = optional(string)
      index_analyzer  = optional(string)
      synonym_maps    = optional(list(string))
      fields = optional(list(object({
        name = string
        type = string
        // ...nested fields for complex types...
      })))
    }))
    suggesters = optional(list(object({
      name         = string
      sourceFields = list(string)
    })))
    scoringProfiles = optional(list(any))
    analyzers       = optional(list(any))
    tokenizers      = optional(list(any))
    tokenFilters    = optional(list(any))
    charFilters     = optional(list(any))
    encryptionKey   = optional(any)
    corsOptions     = optional(any)
    semantic        = optional(any)
    // ...add more as needed from REST API schema...
  }))
  default = []
}

variable "data_sources" {
  description = "List of data sources to create for Azure Search. See Azure Search REST API docs for details."
  type = list(object({
    name                        = string
    type                        = string # e.g. 'azureblob', 'azuresql', 'cosmosdb', etc.
    credentials                 = object({ connectionString = string })
    container                   = object({ name = string, query = optional(string) })
    description                 = optional(string)
    dataChangeDetectionPolicy   = optional(any)
    dataDeletionDetectionPolicy = optional(any)
    encryptionKey               = optional(any)
    etag                        = optional(string)
  }))
  default = []
}

variable "skillsets" {
  description = "List of skillsets to create for Azure Search. See Azure Search REST API docs for details."
  type = list(object({
    name              = string
    skills            = list(any)
    description       = optional(string)
    cognitiveServices = optional(any)
    encryptionKey     = optional(any)
    knowledgeStore    = optional(any)
    semanticSearch    = optional(any)
    etag              = optional(string)
  }))
  default = []
}

variable "indexers" {
  description = "List of indexers to create for Azure Search. See Azure Search REST API docs for details."
  type = list(object({
    name            = string
    dataSourceName  = string
    targetIndexName = string
    schedule = optional(object({
      interval  = string
      startTime = optional(string)
    }))
    description         = optional(string)
    parameters          = optional(any)
    fieldMappings       = optional(list(any))
    outputFieldMappings = optional(list(any))
    skillsetName        = optional(string)
    encryptionKey       = optional(any)
    disabled            = optional(bool)
    etag                = optional(string)
  }))
  default = []
}

variable "semantic_configs" {
  description = "List of semantic configurations to create for Azure Search. See Azure Search REST API docs for details."
  type = list(object({
    name = string
    prioritizedFields = object({
      titleField                = object({ fieldName = string })
      prioritizedContentFields  = list(object({ fieldName = string }))
      prioritizedKeywordsFields = list(object({ fieldName = string }))
    })
    defaultAnswer             = optional(string)
    defaultAnswerField        = optional(string)
    defaultAnswerFieldMapping = optional(any)
  }))
  default = []
}
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

variable "indexes" {
  description = <<EOT
A list of index objects for Azure Cognitive Search indexes. Each object should conform to the API schema:
- name (string, required): The name of the index.
- fields (list(object), required): List of field definitions (see API for structure).
- scoringProfiles (list(object), optional): Scoring profiles for the index.
- defaultScoringProfile (string, optional): Default scoring profile name.
- suggesters (list(object), optional): Suggesters for the index.
- analyzers (list(object), optional): Analyzers for the index.
- tokenizers (list(object), optional): Tokenizers for the index.
- tokenFilters (list(object), optional): Token filters for the index.
- charFilters (list(object), optional): Character filters for the index.
- corsOptions (object, optional): CORS options for the index.
- encryptionKey (object, optional): Encryption key for the index.
- similarity (object, optional): Similarity algorithm for the index.
- semantic (object, optional): Semantic settings for the index.
- vectorSearch (object, optional): Vector search configuration for the index.
- etag (string, optional): ETag for concurrency control.
EOT
  type = list(object({
    name                  = string
    fields                = list(any) # Use 'any' for flexibility, or define a detailed object if needed
    scoringProfiles       = optional(list(any))
    defaultScoringProfile = optional(string)
    suggesters            = optional(list(any))
    analyzers             = optional(list(any))
    tokenizers            = optional(list(any))
    tokenFilters          = optional(list(any))
    charFilters           = optional(list(any))
    corsOptions           = optional(any)
    encryptionKey         = optional(any)
    similarity            = optional(any)
    semantic              = optional(any)
    vectorSearch          = optional(any)
    etag                  = optional(string)
  }))
  default = []
}

variable "indexers" {
  description = <<EOT
A list of indexer objects for Azure Cognitive Search indexers. Each object should conform to the API schema:
- name (string, required): The name of the indexer.
- dataSourceName (string, required): The name of the datasource from which this indexer reads data.
- targetIndexName (string, required): The name of the index to which this indexer writes data.
- description (string, optional): The description of the indexer.
- disabled (bool, optional): Whether the indexer is disabled.
- schedule (object, optional): The schedule for this indexer.
- parameters (object, optional): Parameters for indexer execution.
- encryptionKey (object, optional): Encryption key for the indexer.
- fieldMappings (list(object), optional): Field mappings from data source to index.
- outputFieldMappings (list(object), optional): Output field mappings after enrichment.
- skillsetName (string, optional): The name of the skillset executing with this indexer.
- etag (string, optional): ETag for concurrency control.
EOT
  type = list(object({
    name                = string
    dataSourceName      = string
    targetIndexName     = string
    description         = optional(string)
    disabled            = optional(bool)
    schedule            = optional(any)
    parameters          = optional(any)
    encryptionKey       = optional(any)
    fieldMappings       = optional(list(any))
    outputFieldMappings = optional(list(any))
    skillsetName        = optional(string)
    etag                = optional(string)
  }))
  default = []
}
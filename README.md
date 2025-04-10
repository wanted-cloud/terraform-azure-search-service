<!-- BEGIN_TF_DOCS -->
# wanted-cloud/terraform-azure-search-service

Simple Terraform building block wrapper around Azure AI Search service and related resources.

## Table of contents

- [Requirements](#requirements)
- [Providers](#providers)
- [Variables](#inputs)
- [Outputs](#outputs)
- [Resources](#resources)
- [Usage](#usage)
- [Contributing](#contributing)

## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (>= 1.9)

- <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) (>=4.20.0)

## Providers

The following providers are used by this module:

- <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) (>=4.20.0)

## Required Inputs

The following input variables are required:

### <a name="input_name"></a> [name](#input\_name)

Description: Name of the Azure service plan.

Type: `string`

### <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name)

Description: Name of the resource group in which the Azure service plan will be created.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_allowed_ips"></a> [allowed\_ips](#input\_allowed\_ips)

Description: List of allowed IP addresses for the Azure service plan.

Type: `list(string)`

Default: `[]`

### <a name="input_authentication_failure_mode "></a> [authentication\_failure\_mode ](#input\_authentication\_failure\_mode )

Description: Authentication failure mode for the Azure service plan.

Type: `string`

Default: `"http403"`

### <a name="input_customer_managed_key_enforcement_enabled"></a> [customer\_managed\_key\_enforcement\_enabled](#input\_customer\_managed\_key\_enforcement\_enabled)

Description: Enable customer managed key enforcement.

Type: `bool`

Default: `false`

### <a name="input_hosting_mode"></a> [hosting\_mode](#input\_hosting\_mode)

Description: Hosting mode of the Azure service plan.

Type: `string`

Default: `"default"`

### <a name="input_identity_type"></a> [identity\_type](#input\_identity\_type)

Description: Type of identity to use for the Azure service plan.

Type: `string`

Default: `""`

### <a name="input_local_authentication_enabled"></a> [local\_authentication\_enabled](#input\_local\_authentication\_enabled)

Description: Enable local authentication for the Azure service plan.

Type: `bool`

Default: `false`

### <a name="input_location"></a> [location](#input\_location)

Description: Location of the resource group in which the Azure service plan will be created, if not set it will be the same as the resource group.

Type: `string`

Default: `""`

### <a name="input_metadata"></a> [metadata](#input\_metadata)

Description: Metadata definitions for the module, this is optional construct allowing override of the module defaults defintions of validation expressions, error messages, resource timeouts and default tags.

Type:

```hcl
object({
    resource_timeouts = optional(
      map(
        object({
          create = optional(string, "30m")
          read   = optional(string, "5m")
          update = optional(string, "30m")
          delete = optional(string, "30m")
        })
      ), {}
    )
    tags                     = optional(map(string), {})
    validator_error_messages = optional(map(string), {})
    validator_expressions    = optional(map(string), {})
  })
```

Default: `{}`

### <a name="input_network_rule_bypass_option"></a> [network\_rule\_bypass\_option](#input\_network\_rule\_bypass\_option)

Description: Network rule bypass option for the Azure service plan.

Type: `string`

Default: `"None"`

### <a name="input_partition_count"></a> [partition\_count](#input\_partition\_count)

Description: Number of partitions for the Azure service plan.

Type: `number`

Default: `1`

### <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled)

Description: Enable public network access for the Azure service plan.

Type: `bool`

Default: `true`

### <a name="input_replica_count"></a> [replica\_count](#input\_replica\_count)

Description: Number of replicas for the Azure service plan.

Type: `number`

Default: `1`

### <a name="input_semantic_search_sku"></a> [semantic\_search\_sku](#input\_semantic\_search\_sku)

Description: SKU for semantic search.

Type: `string`

Default: `"free"`

### <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name)

Description: Name of the SKU to use for the Azure service plan.

Type: `string`

Default: `"basic"`

### <a name="input_tags"></a> [tags](#input\_tags)

Description: Tags to apply to the Azure service plan.

Type: `map(string)`

Default: `{}`

### <a name="input_user_assigned_identity_ids"></a> [user\_assigned\_identity\_ids](#input\_user\_assigned\_identity\_ids)

Description: List of user assigned identity IDs for the Azure service plan.

Type: `list(string)`

Default: `""`

## Outputs

No outputs.

## Resources

The following resources are used by this module:

- [azurerm_search_service.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/search_service) (resource)
- [azurerm_resource_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) (data source)

## Usage

> For more detailed examples navigate to `examples` folder of this repository.

Module was also published via Terraform Registry and can be used as a module from the registry.

```hcl
module "example" {
  source  = "wanted-cloud/azure-search-service/azure"
  version = "x.y.z"
}
```

### Basic usage example

The minimal usage for the module is as follows:

```hcl
module "template" {
    source = "../.."
}
```
## Contributing

_Contributions are welcomed and must follow [Code of Conduct](https://github.com/wanted-cloud/.github?tab=coc-ov-file) and common [Contributions guidelines](https://github.com/wanted-cloud/.github/blob/main/docs/CONTRIBUTING.md)._

> If you'd like to report security issue please follow [security guidelines](https://github.com/wanted-cloud/.github?tab=security-ov-file).
---
<sup><sub>_2025 &copy; All rights reserved - WANTED.solutions s.r.o._</sub></sup>
<!-- END_TF_DOCS -->
<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_iam_workload_identity_pool.pool](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_workload_identity_pool) | resource |
| [google_iam_workload_identity_pool_provider.provider](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_workload_identity_pool_provider) | resource |
| [google_service_account_iam_member.member](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account_iam_member) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_attribute_condition"></a> [attribute\_condition](#input\_attribute\_condition) | Workload Identity Pool Provider attribute condition expression | `string` | `null` | no |
| <a name="input_attribute_mapping"></a> [attribute\_mapping](#input\_attribute\_mapping) | Workload Identity Pool Provider attribute mapping | `map(any)` | n/a | yes |
| <a name="input_issuer_uri"></a> [issuer\_uri](#input\_issuer\_uri) | Workload Identity Pool Provider issuer URL | `string` | `"https://token.actions.githubusercontent.com"` | no |
| <a name="input_pool_id"></a> [pool\_id](#input\_pool\_id) | Workload Identity Pool ID | `string` | `"github-pool"` | no |
| <a name="input_provider_description"></a> [provider\_description](#input\_provider\_description) | Workload Identity Pool Provider description | `string` | `"Workload Identity Pool Provider managed by Terraform"` | no |
| <a name="input_provider_disabled"></a> [provider\_disabled](#input\_provider\_disabled) | Workload Identity Pool Provider disabled | `bool` | `false` | no |
| <a name="input_provider_display_name"></a> [provider\_display\_name](#input\_provider\_display\_name) | Workload Identity Pool Provider display name | `string` | `"github-provider"` | no |
| <a name="input_provider_id"></a> [provider\_id](#input\_provider\_id) | Workload Identity Pool Provider ID | `string` | `"github-provider"` | no |
| <a name="input_service_accounts"></a> [service\_accounts](#input\_service\_accounts) | Service Account resource names and corresponding provider attributes | <pre>list(object({<br/>    name           = string<br/>    attribute      = string<br/>    all_identities = bool<br/>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_pool_id"></a> [pool\_id](#output\_pool\_id) | Identifier for the pool |
| <a name="output_provider_id"></a> [provider\_id](#output\_provider\_id) | Identifier for the provider |
| <a name="output_provider_name"></a> [provider\_name](#output\_provider\_name) | Name for the provider |
| <a name="output_provider_state"></a> [provider\_state](#output\_provider\_state) | State of the provider |
<!-- END_TF_DOCS -->
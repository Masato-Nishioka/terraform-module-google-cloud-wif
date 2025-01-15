# Workload Identity Federation

これは、[Workload Identity Pool](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_workload_identity_pool), [Workload Identity Pool Provider](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_workload_identity_pool_provider), [Service Account IAM Member](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_service_account_iam)のモジュールを管理するリポジトリです。

## Usage

このモジュールの使用例は以下です：

```hcl
module "workload_identity_federation" {
  source                           = "github.com/sample-org/sample-repo"
  project_id                       = "gcp-project-id"
  project_number                   = "gcp-project-number"
  repository_owner_or_organization = "sample-org"
  repository_name                  = "sample-repo"
  service_account_email            = "service-account-email"
}
```

## Requirements

このモジュールを使用する上での必須条件は以下です：

- GitHub Actionsが権限を借用するサービスアカウントが存在すること

## Resources

| Name | Type |
|------|------|
| [google_iam_workload_identity_pool.pool](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_workload_identity_pool) | resource |
| [google_iam_workload_identity_pool_provider.provider](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_workload_identity_pool_provider) | resource |
| [google_service_account_iam_member.admin-account-iam](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account_iam_member) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_attribute_mapping"></a> [attribute\_mapping](#input\_attribute\_mapping) | GitHub ActionsからGCPへの属性マッピングを定義するマップ。</br>GitHub Actionsのトークンの属性をGCPの属性にマッピングする | `map(string)` | <pre>{<br/>  "attribute.repository": "assertion.repository",<br/>  "google.subject": "assertion.sub"<br/>}</pre> | no |
| <a name="input_issuer_uri"></a> [issuer\_uri](#input\_issuer\_uri) | GitHub Actionsが発行するOIDCトークンの発行元URL | `string` | `"https://token.actions.githubusercontent.com"` | no |
| <a name="input_pool_id"></a> [pool\_id](#input\_pool\_id) | Workload Identity Poolの一意の識別子。</br>4-32文字の英数字とハイフンが使用可能（gcp-で始まる名前は使用不可） | `string` | `"github-pool"` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | Workload Identity Poolを作成するGCPプロジェクトのID | `string` | n/a | yes |
| <a name="input_project_number"></a> [project\_number](#input\_project\_number) | GCPプロジェクトに割り当てられた一意のプロジェクト番号 | `string` | n/a | yes |
| <a name="input_provider_id"></a> [provider\_id](#input\_provider\_id) | Workload Identity Pool Providerの一意の識別子。</br>4-32文字の英数字とハイフンが使用可能（gcp-で始まる名前は使用不可） | `string` | `"github-provider"` | no |
| <a name="input_repository_name"></a> [repository\_name](#input\_repository\_name) | 認証を許可するGitHubリポジトリの名前 | `string` | n/a | yes |
| <a name="input_repository_owner_or_organization"></a> [repository\_owner\_or\_organization](#input\_repository\_owner\_or\_organization) | 認証を許可するGitHubリポジトリの所有者またはOrganization名 | `string` | n/a | yes |
| <a name="input_service_account_email"></a> [service\_account\_email](#input\_service\_account\_email) | GitHub Actionsから利用されるGCPサービスアカウントのメールアドレス | `string` | n/a | yes |

## Outputs

No outputs.

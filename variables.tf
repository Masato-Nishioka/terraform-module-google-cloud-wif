# Project
variable "project_id" {
  description = "Workload Identity Poolを作成するGCPプロジェクトのID"
  type        = string
}

variable "project_number" {
  description = "GCPプロジェクトに割り当てられた一意のプロジェクト番号"
  type        = string
}

# Identity pool
variable "pool_id" {
  description = "Workload Identity Poolの一意の識別子。4-32文字の英数字とハイフンが使用可能（gcp-で始まる名前は使用不可）"
  type        = string
  default     = "github-pool"

  validation {
    condition     = substr(var.pool_id, 0, 4) != "gcp-" && length(regex("([a-z0-9-]{4,32})", var.pool_id)) == 1
    error_message = "The pool_id value should be 4-32 characters, and may contain the characters [a-z0-9-]."
  }
}

# Identity pool provider
variable "provider_id" {
  description = "Workload Identity Pool Providerの一意の識別子。4-32文字の英数字とハイフンが使用可能（gcp-で始まる名前は使用不可）"
  type        = string
  default     = "github-provider"

  validation {
    condition     = substr(var.provider_id, 0, 4) != "gcp-" && length(regex("([a-z0-9-]{4,32})", var.provider_id)) == 1
    error_message = "The provider_id value should be 4-32 characters, and may contain the characters [a-z0-9-]."
  }
}

variable "attribute_mapping" {
  description = "GitHub ActionsからGCPへの属性マッピングを定義するマップ。GitHub Actionsのトークンの属性をGCPの属性にマッピングする"
  type        = map(string)
  default = {
    "google.subject"       = "assertion.sub"
    "attribute.repository" = "assertion.repository"
  }
}

variable "issuer_uri" {
  description = "GitHub Actionsが発行するOIDCトークンの発行元URL"
  type        = string
  default     = "https://token.actions.githubusercontent.com"
}

# Service account impersonation
variable "service_account_email" {
  description = "GitHub Actionsから利用されるGCPサービスアカウントのメールアドレス"
  type        = string
}

variable "repository_owner_or_organization" {
  description = "認証を許可するGitHubリポジトリの所有者またはOrganization名"
  type        = string
}

variable "repository_name" {
  description = "認証を許可するGitHubリポジトリの名前"
  type        = string
}

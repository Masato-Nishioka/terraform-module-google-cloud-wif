# Project

variable "project_id" {
  type        = string
  description = "The project ID to create the Workload Identity Pool"
}

variable "project_number" {
  description = "The project number of the GCP project"
  type        = string
}

# Identity pool
variable "pool_id" {
  type        = string
  description = "Workload Identity Pool ID"
  default     = "github-pool"

  validation {
    condition     = substr(var.pool_id, 0, 4) != "gcp-" && length(regex("([a-z0-9-]{4,32})", var.pool_id)) == 1
    error_message = "The pool_id value should be 4-32 characters, and may contain the characters [a-z0-9-]."
  }
}

variable "pool_display_name" {
  type        = string
  description = "Workload Identity Pool display name"
  default     = "github-pool"
}

variable "pool_description" {
  type        = string
  description = "Workload Identity Pool description"
  default     = "Workload Identity Pool managed by Terraform"
}

variable "pool_disabled" {
  type        = bool
  description = "Workload Identity Pool disabled"
  default     = false
}

# Identity pool provider

variable "provider_id" {
  type        = string
  description = "Workload Identity Pool Provider ID"
  default     = "github-provider"

  validation {
    condition     = substr(var.provider_id, 0, 4) != "gcp-" && length(regex("([a-z0-9-]{4,32})", var.provider_id)) == 1
    error_message = "The provider_id value should be 4-32 characters, and may contain the characters [a-z0-9-]."
  }
}

variable "provider_display_name" {
  type        = string
  description = "Workload Identity Pool Provider display name"
  default     = "github-provider"
}

variable "provider_description" {
  type        = string
  description = "Workload Identity Pool Provider description"
  default     = "Workload Identity Pool Provider managed by Terraform"
}

variable "provider_disabled" {
  type        = bool
  description = "Workload Identity Pool Provider disabled"
  default     = false
}

variable "attribute_mapping" {
  description = "Workload Identity Pool Provider attribute mapping"
  type        = map(string)
  default = {
    "google.subject"       = "assertion.sub"
    "attribute.repository" = "assertion.repository"
  }
}

variable "issuer_uri" {
  type        = string
  description = "Workload Identity Pool Provider issuer URL"
  default     = "https://token.actions.githubusercontent.com"
}

# Service account impersonation

variable "service_account_email" {
  description = "The email address of the service account"
  type        = string
}

variable "repository_owner_or_organization" {
  description = "GitHub repository owner or organization name"
  type        = string
}

variable "repository_name" {
  description = "GitHub repository name"
  type        = string
}

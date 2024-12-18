# Identity pool
# (https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_workload_identity_pool_provider#example-usage---iam-workload-identity-pool-provider-github-actions)

resource "google_iam_workload_identity_pool" "pool" {
  workload_identity_pool_id = var.pool_id
}

# Identity pool provider

resource "google_iam_workload_identity_pool_provider" "provider" {
  workload_identity_pool_id = google_iam_workload_identity_pool.pool.workload_identity_pool_id
  workload_identity_pool_provider_id = var.provider_id
  display_name                       = var.provider_display_name
  description                        = var.provider_description
  disabled                           = var.provider_disabled
  attribute_condition = var.attribute_condition
  attribute_mapping                  = {
    "google.subject"        = "assertion.sub"
    "attribute.repository"  = "assertion.repository"
  }
  oidc {
    issuer_uri        = var.issuer_uri
  }
}

# Service account impersonation
# (https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_service_account_iam#google_service_account_iam_member)

resource "google_service_account_iam_member" "member" {
  for_each = { for index, account in var.service_accounts : index => account }

  service_account_id = each.value.name
  member             = "${each.value.all_identities == false ? "principal" : "principalSet"}://iam.googleapis.com/${google_iam_workload_identity_pool.pool.name}/${each.value.attribute}"
  role               = "roles/iam.workloadIdentityUser"
}
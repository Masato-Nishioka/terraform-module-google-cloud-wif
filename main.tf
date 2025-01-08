resource "google_iam_workload_identity_pool" "pool" {
  project                   = var.project_id
  workload_identity_pool_id = var.pool_id
}

resource "google_iam_workload_identity_pool_provider" "provider" {
  project                            = var.project_id
  workload_identity_pool_id          = var.pool_id
  workload_identity_pool_provider_id = var.provider_id
  attribute_mapping                  = var.attribute_mapping
  attribute_condition                = "assertion.repository == '${var.repository_owner_or_organization}/${var.repository_name}'"
  oidc {
    issuer_uri = var.issuer_uri
  }
  depends_on = [
    google_iam_workload_identity_pool.pool
  ]
}

resource "google_service_account_iam_member" "admin-account-iam" {
  service_account_id = "projects/${var.project_id}/serviceAccounts/${var.service_account_email}"
  role               = "roles/iam.workloadIdentityUser"
  member             = "principalSet://iam.googleapis.com/projects/${var.project_number}/locations/global/workloadIdentityPools/${var.pool_id}/attribute.repository/${var.repository_owner_or_organization}/${var.repository_name}"
  depends_on = [
    google_iam_workload_identity_pool.pool
  ]
}
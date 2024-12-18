# Identity pool

output "pool_id" {
  description = "Identifier for the pool"
  value       = google_iam_workload_identity_pool.pool.id
}

# Identity pool provider

output "provider_id" {
  description = "Identifier for the provider"
  value       = google_iam_workload_identity_pool_provider.provider.id
}

output "provider_state" {
  description = "State of the provider"
  value       = google_iam_workload_identity_pool_provider.provider.state
}

output "provider_name" {
  description = "Name for the provider"
  value       = google_iam_workload_identity_pool_provider.provider.name
}
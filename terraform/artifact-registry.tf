resource "google_artifact_registry_repository" "artifact_registry" {
  location               = var.region
  repository_id          = "${var.gcp_project_id}"
  format                 = "DOCKER"
  cleanup_policy_dry_run = false
}
# Project Service Account
resource "google_service_account" "service_account" {
  account_id   = "${var.gcp_project_id}-service-account"
}

resource "google_project_iam_member" "gke_cluster_admin_iam_binding" {
  project = var.gcp_project_id
  role    = "roles/container.clusterAdmin"
  member  = "serviceAccount:${google_service_account.service_account.email}"
}

resource "google_project_iam_member" "artifact_registry_admin_iam_binding" {
  project = var.gcp_project_id
  role    = "roles/artifactregistry.admin"
  member  = "serviceAccount:${google_service_account.service_account.email}"
}

resource "google_project_iam_member" "gke_engine_admin_iam_binding" {
  project = var.gcp_project_id
  role    = "roles/container.admin"
  member  = "serviceAccount:${google_service_account.service_account.email}"
}

resource "google_service_account_key" "service_account_key" {
  service_account_id = google_service_account.service_account.name
}
resource "google_compute_network" "vpc" {
  name                    = "${var.gcp_project_id}-vpc"
  auto_create_subnetworks = "false"
}

# Subnet
resource "google_compute_subnetwork" "subnet" {
  name          = "${var.gcp_project_id}-subnet"
  region        = var.region
  network       = google_compute_network.vpc.name
  ip_cidr_range = var.subnet_ip_cidr_range
  secondary_ip_range {
    range_name    = "${var.gcp_project_id}-k8s-pod-range"
    ip_cidr_range = var.pods_cidr_block
  }
  secondary_ip_range {
    range_name    = "${var.gcp_project_id}-k8s-service-range"
    ip_cidr_range = var.services_cidr_block
  }
}

resource "google_compute_address" "cloud_nat_external_ip" {
  name   = "${var.gcp_project_id}-cloud-nat-ip"
  region = var.region
}

resource "google_compute_router" "router" {
  name    = "${var.gcp_project_id}-router"
  region  = google_compute_subnetwork.subnet.region
  network = google_compute_network.vpc.id
}

resource "google_compute_router_nat" "nat_manual" {
  name   = "${var.gcp_project_id}-nat"
  router = google_compute_router.router.name
  region = google_compute_router.router.region

  nat_ip_allocate_option = "MANUAL_ONLY"
  nat_ips                = [google_compute_address.cloud_nat_external_ip.self_link]

  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  subnetwork {
    name                    = google_compute_subnetwork.subnet.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }
}
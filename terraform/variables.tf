variable "region" {
  description = "region"
  validation {
    condition     = length(var.region) > 0
    error_message = "The 'region' variable must be set."
  }
}

variable "gcp_project_id" {
  type        = string
  description = "ID of project"
  validation {
    condition     = length(var.gcp_project_id) > 0
    error_message = "The 'gcp_project_id' variable must be set."
  }
}

variable "gcr_name" {
  type        = string
  description = "GCR name of project"
  validation {
    condition     = length(var.gcr_name) > 0
    error_message = "The 'gcr_name' variable must be set."
  }
}

# GKE Configuration
variable "subnet_ip_cidr_range" {
  type        = string
  description = "ip cidr range of subnet"
  validation {
    condition     = length(var.subnet_ip_cidr_range) > 0
    error_message = "The 'subnet_ip_cidr_range' variable must be set."
  }
}

variable "pods_cidr_block" {
  type        = string
  description = "cidr block of pods"
  validation {
    condition     = length(var.pods_cidr_block) > 0
    error_message = "The 'pods_cidr_block' variable must be set."
  }
}

variable "services_cidr_block" {
  type        = string
  description = "cidr block of services"
  validation {
    condition     = length(var.services_cidr_block) > 0
    error_message = "The 'services_cidr_block' variable must be set."
  }
}

variable "master_authorized_networks_cidr_blocks" {
  type        = list(string)
  description = "cidr block list of allowed access to master"
  validation {
    condition     = length(var.master_authorized_networks_cidr_blocks) > 0
    error_message = "The 'master_authorized_networks_cidr_blocks' variable must be set."
  }
}

variable "master_cidr_block" {
  type        = string
  description = "cidr block of master"
  validation {
    condition     = length(var.master_cidr_block) > 0
    error_message = "The 'master_cidr_block' variable must be set."
  }
}

variable "gke_version_prefix" {
  type        = string
  description = "prefix version of gke cluster"
  validation {
    condition     = length(var.gke_version_prefix) > 0
    error_message = "The 'gke_version_prefix' variable must be set."
  }
}

variable "maintenance_window_start_time" {
  type        = string
  description = "maintenance window start time of gke cluster"
  validation {
    condition     = length(var.maintenance_window_start_time) > 0
    error_message = "The 'maintenance_window_start_time' variable must be set."
  }
}

variable "maintenance_window_duration" {
  type        = string
  description = "maintenance window duration of gke cluster"
  default     = "4h"
}
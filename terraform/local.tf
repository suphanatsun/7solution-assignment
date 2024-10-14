locals {
  maintenance_window_start_time = "2000-01-01T${var.maintenance_window_start_time}:00+07:00"
  maintenance_window_end_time   = timeadd("${local.maintenance_window_start_time}", "${var.maintenance_window_duration}")
}
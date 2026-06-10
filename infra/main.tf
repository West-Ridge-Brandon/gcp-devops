############################################
# VPC Network
############################################
resource "google_compute_network" "vpc" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
}

############################################
# Subnet
############################################
resource "google_compute_subnetwork" "subnet" {
  name          = var.subnet_name
  ip_cidr_range = var.subnet_cidr
  region        = var.region
  network       = google_compute_network.vpc.id
}

############################################
# Firewall Rule
############################################
resource "google_compute_firewall" "firewall" {
  name    = var.firewall_name
  network = google_compute_network.vpc.name

  allow {
    protocol = var.firewall_protocol
    ports    = var.firewall_ports
  }

  source_ranges = var.firewall_source_ranges
}

############################################
# Storage Bucket
############################################
resource "google_storage_bucket" "bucket" {
  name     = var.bucket_name
  location = var.region
}

############################################
# Compute Instance
############################################
resource "google_compute_instance" "vm" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.instance_image
    }
  }

  network_interface {
    network    = google_compute_network.vpc.id
    subnetwork = google_compute_subnetwork.subnet.id

    access_config {} # assigns external IP
  }

  tags = var.instance_tags
}

############################################
# Service Account
############################################
resource "google_service_account" "vm_sa" {
  account_id   = var.sa_id
  display_name = var.sa_name
}

# -------------------------
# Networking - 1
# -------------------------
resource "google_compute_network" "vpc" {
  name = "demo-vpc"
}

resource "google_compute_subnetwork" "subnet" {
  name          = "demo-subnet"
  ip_cidr_range = "10.0.1.0/24"
  region        = var.region
  network       = google_compute_network.vpc.id
}

resource "google_compute_firewall" "allow_ssh" {
  name    = "allow-ssh"
  network = google_compute_network.vpc.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}

# -------------------------
# Compute Engine Instance - 2
# -------------------------
resource "google_compute_instance" "vm" {
  name         = var.instance_name
  machine_type = "e2-micro"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.subnet.id
    access_config {}
  }

  service_account {
    email  = google_service_account.sa.email
    scopes = ["cloud-platform"]
  }
}

# -------------------------
# Storage - 3
# -------------------------
resource "google_storage_bucket" "bucket" {
  name     = var.bucket_name
  location = var.region
}

# -------------------------
# IAM + Service Account - 4
# -------------------------
resource "google_service_account" "sa" {
  account_id   = "demo-sa"
  display_name = "Demo Service Account"
}

resource "google_storage_bucket_iam_member" "sa_bucket_access" {
  bucket = google_storage_bucket.bucket.name
  role   = "roles/storage.objectAdmin"
  member = "serviceAccount:${google_service_account.sa.email}"
}

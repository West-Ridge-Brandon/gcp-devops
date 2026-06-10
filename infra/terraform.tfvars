# Core
project_id = "919900949320"
region     = "us-central1"
zone       = "us-central1-a"

# VPC + Subnet
vpc_name    = "demo-vpc"
subnet_name = "demo-subnet"
subnet_cidr = "10.0.1.0/24"

# Firewall
firewall_name          = "allow-ssh"
firewall_protocol      = "tcp"
firewall_ports         = ["22"]
firewall_source_ranges = ["0.0.0.0/0"]

# Bucket
bucket_name = "demo-bucket-123"

# Instance
instance_name  = "demo-instance"
machine_type   = "e2-micro"
instance_image = "debian-cloud/debian-12"
instance_tags  = ["ssh"]

# Service Account
vm_service_account_id = "first-service-account"
vm_service_account_name = "Service account for VM accessing GCS"

# Only the ID is used to make the email account: vm-sa@PROJECT_ID.iam.gserviceaccount.com
# sa_name is only used to help identify it in a list


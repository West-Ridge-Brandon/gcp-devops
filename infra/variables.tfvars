# Core project settings
project_id = "my-test-project-123"
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

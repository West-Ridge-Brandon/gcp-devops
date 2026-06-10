# Core project settings
variable "project_id" { type = string }
variable "region"     { type = string }
variable "zone"       { type = string }

# VPC + Subnet
variable "vpc_name"       { type = string }
variable "subnet_name"    { type = string }
variable "subnet_cidr"    { type = string }

# Firewall
variable "firewall_name"          { type = string }
variable "firewall_protocol"      { type = string }
variable "firewall_ports"         { type = list(string) }
variable "firewall_source_ranges" { type = list(string) }

# Bucket
variable "bucket_name" { type = string }

# Instance
variable "instance_name"  { type = string }
variable "machine_type"   { type = string }
variable "instance_image" { type = string }
variable "instance_tags"  { type = list(string) }

# Service Account
variable "vm_service_account_id"   { type = string }
variable "vm_service_account_name" { type = string }

############################################
# Outputs
############################################

output "VPC-Name"              { value = google_compute_network.vpc.name }

output "Subnet-Name"           { value = google_compute_subnetwork.subnet.name }

output "Firewall-Rule-Name"    { value = google_compute_firewall.firewall.name }

output "Instance-Name"         { value = google_compute_instance.vm.name }

output "Instance-External-IP"  { value = google_compute_instance.vm.network_interface[0].access_config[0].nat_ip }

output "Bucket-Name"           { value = google_storage_bucket.bucket.name }

output "Service-Account-Email" { value = google_service_account.vm_sa.account_id }
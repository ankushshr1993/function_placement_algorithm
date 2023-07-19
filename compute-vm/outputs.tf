output "external_ip" {
  description = "Instance main interface external IP addresses."
  value = (
    var.network_interfaces[0].nat
    ? try(google_compute_instance.vm.network_interface.0.access_config.0.nat_ip, null)
    : null
  ) 
}

output "internal_ip" {
  description = "Instance main interface internal IP addresses."
  value = google_compute_instance.vm.network_interface.0.network_ip
}

output "name" {
  description = "name "
  value = google_compute_instance.vm.name
}

output "zone" {
  description = "zone "
  value = google_compute_instance.vm.zone
}

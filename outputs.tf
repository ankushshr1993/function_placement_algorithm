output "vm_master_ip" {
  description = "Master virtual machine IP addresses."
  value = module.virtual_machine_master.external_ip
}
output "vm_worker1_ip" {
  description = "Wroker virtual machine IP addresses."
  value = module.virtual_machine_worker1.external_ip
}
output "vm_worker2_ip" {
  description = "Wroker virtual machine IP addresses."
  value = module.virtual_machine_worker2.external_ip
}
output "vm_worker3_ip" {
  description = "Wroker virtual machine IP addresses."
  value = module.virtual_machine_worker3.external_ip
}
output "vm_worker4_ip" {
  description = "Wroker virtual machine IP addresses."
  value = module.virtual_machine_worker4.external_ip
}

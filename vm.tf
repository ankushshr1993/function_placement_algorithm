module "virtual_machine_master" {
  source                   = "./compute-vm"
  project_id               = "abhishek-378314"
  region                   = "europe-west3"
  zone                     = "europe-west3-a"
  name                     = "master-automation"
  instance_type            = "e2-standard-2"
  user                     = "ankush_sharma_job_gmail_com"
  network_interfaces = [
    {
      network              = "default"                                                                                     # virtual network name or self_link
      subnetwork           = "projects/abhishek-378314/regions/europe-west3/subnetworks/default"
      #subnetwork           = "projects/abhishek-378314/regions/europe-west3/subnetworks/vnet-1-us-central1-subnet-1" # subnet name or self_link
      nat                  = true                                                                                         # nat is false external_ip is not assigned to vm. if true external_ip address is assigned to vm.
      addresses            = null                                                                                         # have two keys internal and external. internal = private_ip address external = public_ip address eg. mentioned below. If set to null they will be auto assigned. external_ip is only assigned if nat is true. 
    }
  ]

  # attached_disks           = [
  #                             {
  #                               name                 = "master-node-disk"
  #                               source               = "master-node-disk"
  #                               options              = {
  #                                                       mode               = null
  #                                                      } 
  #                             }
  #                            ]

  boot_disk                = {
                              image                  = "projects/ubuntu-os-cloud/global/images/family/ubuntu-2004-lts"
                              type                   = "pd-balanced"
                              size                   = 60
                             }
}

module "virtual_machine_worker1" {
  source                   = "./compute-vm"
  project_id               = "abhishek-378314"
  region                   = "asia-east1"
  zone                     = "asia-east1-a"
  name                     = "worker-node1"
  instance_type            = "e2-standard-2"
  user                     = "ankush_sharma_job_gmail_com"
  network_interfaces       = [
                                {
                                  network    = "default"                      # virtual network name or self_link
                                  subnetwork = "projects/abhishek-378314/regions/asia-east1/subnetworks/default"
                                  nat        = true                          # nat is false external_ip is not assigned to vm. if true external_ip address is assigned to vm.
                                  addresses  = null                          # have two keys internal and external. internal = private_ip address external = public_ip address eg. mentioned below. If set to null they will be auto assigned. external_ip is only assigned if nat is true. 
                                }
                              ]
  
  
  boot_disk                = {
                              image = "projects/ubuntu-os-cloud/global/images/family/ubuntu-2004-lts"
                              type  = "pd-balanced"
                              size  = 60
                             }
}

module "virtual_machine_worker2" {
  source                   = "./compute-vm"
  project_id               = "abhishek-378314"
  region                   = "us-central1"
  zone                     = "us-central1-a"
  name                     = "worker-node2"
  instance_type            = "e2-standard-2"
  user                     = "ankush_sharma_job_gmail_com"
  network_interfaces       = [
                                {
                                  network    = "default"                      # virtual network name or self_link
                                  subnetwork = "projects/abhishek-378314/regions/us-central1/subnetworks/default"
                                  nat        = true                          # nat is false external_ip is not assigned to vm. if true external_ip address is assigned to vm.
                                  addresses  = null                          # have two keys internal and external. internal = private_ip address external = public_ip address eg. mentioned below. If set to null they will be auto assigned. external_ip is only assigned if nat is true. 
                                }
                              ]
  
  
  boot_disk                = {
                              image = "projects/ubuntu-os-cloud/global/images/family/ubuntu-2004-lts"
                              type  = "pd-balanced"
                              size  = 60
                             }
}

module "virtual_machine_worker3" {
  source                   = "./compute-vm"
  project_id               = "abhishek-378314"
  region                   = "southamerica-east1"
  zone                     = "southamerica-east1-a"
  name                     = "worker-node3"
  instance_type            = "e2-standard-2"
  user                     = "ankush_sharma_job_gmail_com"
  network_interfaces       = [
                                {
                                  network    = "default"                      # virtual network name or self_link
                                  subnetwork = "projects/abhishek-378314/regions/southamerica-east1/subnetworks/default"
                                  nat        = true                          # nat is false external_ip is not assigned to vm. if true external_ip address is assigned to vm.
                                  addresses  = null                          # have two keys internal and external. internal = private_ip address external = public_ip address eg. mentioned below. If set to null they will be auto assigned. external_ip is only assigned if nat is true. 
                                }
                              ]
  
  
 
  boot_disk                = {
                              image = "projects/ubuntu-os-cloud/global/images/family/ubuntu-2004-lts"
                              type  = "pd-balanced"
                              size  = 60
                             }
}

module "virtual_machine_worker4" {
  source                   = "./compute-vm"
  project_id               = "abhishek-378314"
  region                   = "australia-southeast1"
  zone                     = "australia-southeast1-a"
  name                     = "worker-node4"
  instance_type            = "e2-standard-2"
  user                     = "ankush_sharma_job_gmail_com"
  network_interfaces       = [
                                {
                                  network    = "default"                      # virtual network name or self_link
                                  subnetwork = "projects/abhishek-378314/regions/australia-southeast1/subnetworks/default"
                                  nat        = true                          # nat is false external_ip is not assigned to vm. if true external_ip address is assigned to vm.
                                  addresses  = null                          # have two keys internal and external. internal = private_ip address external = public_ip address eg. mentioned below. If set to null they will be auto assigned. external_ip is only assigned if nat is true. 
                                }
                              ]
  
  
 
  boot_disk                = {
                              image = "projects/ubuntu-os-cloud/global/images/family/ubuntu-2004-lts"
                              type  = "pd-balanced"
                              size  = 60
                             }
}

resource "null_resource" "private_ip_file" {
  provisioner "local-exec" {
    command     = <<-EOT
		echo "${module.virtual_machine_master.internal_ip},${module.virtual_machine_master.name},${module.virtual_machine_master.zone}" > ./scripts/ip_address
		echo "${module.virtual_machine_worker1.internal_ip},${module.virtual_machine_worker1.name},${module.virtual_machine_worker1.zone}" >> ./scripts/ip_address
		echo "${module.virtual_machine_worker2.internal_ip},${module.virtual_machine_worker2.name},${module.virtual_machine_worker2.zone}" >> ./scripts/ip_address
		echo "${module.virtual_machine_worker3.internal_ip},${module.virtual_machine_worker3.name},${module.virtual_machine_worker3.zone}" >> ./scripts/ip_address
		echo "${module.virtual_machine_worker4.internal_ip},${module.virtual_machine_worker4.name},${module.virtual_machine_worker4.zone}" >> ./scripts/ip_address 
  EOT
    interpreter = ["/bin/bash", "-c"]
  }
  depends_on = [ module.virtual_machine_master,module.virtual_machine_worker1,module.virtual_machine_worker2,module.virtual_machine_worker3,module.virtual_machine_worker4 ]
}

module "kubernetes_install" {
  #count                         = 4
  source                        = "./install-kubernetes"
  user                          = "ankush_sharma_job_gmail_com"
  master_ip                     = module.virtual_machine_master.external_ip
  worker1_ip                    = module.virtual_machine_worker1.external_ip
  worker2_ip                    = module.virtual_machine_worker2.external_ip
  worker3_ip                    = module.virtual_machine_worker3.external_ip
  worker4_ip                    = module.virtual_machine_worker4.external_ip
  depends_on = [ module.virtual_machine_master, module.virtual_machine_worker1, module.virtual_machine_worker2, module.virtual_machine_worker3, module.virtual_machine_worker4 , null_resource.private_ip_file ]
}

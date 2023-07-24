resource "google_compute_instance" "compute_engine_pub" {
  name         = format("%s-%s-server", var.project_name, var.environment_map[var.target_env])
  machine_type = var.machine_types[var.target_env]
  zone         = var.zone_name
  labels = {
    environment = var.environment_map[var.target_env]
  }

  tags = var.tags

  boot_disk {
    initialize_params {
      image = var.image
      }
    }

  network_interface {
    network = var.network_interface
    
    access_config { 
      #external_static_ip   ....this block will add a external ip to the machine
    }
  }
}

# resource "google_compute_instance" "compute_engine_pvt" {
#   name         = format("%s-%s-server", var.project_name, var.environment_map[var.target_env])
#   machine_type = var.machine_types[var.target_env]
#   zone         = var.zone_name
#   labels = {
#     environment = var.environment_map[var.target_env]
#   }

#   tags = var.tags

#   boot_disk {
#     initialize_params {
#       image = var.image
#       }
#     }

#   network_interface {
#     network = var.network_interface
#   }
# }


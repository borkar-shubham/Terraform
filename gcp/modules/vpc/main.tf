resource "google_compute_network" "my-vpc_network" {
  name                    = format("%s-%s-vpc", var.project_name, var.environment_map[var.target_env])
  project                 = var.project_name
  auto_create_subnetworks = false
}

#Public Subnet
resource "google_compute_subnetwork" "public_subnet" {
  name          = format("%s-%s-public", var.project_name, var.environment_map[var.target_env])
  ip_cidr_range = var.pub_ip_cidr_range
  region        = var.region
  network       = google_compute_network.my-vpc_network.id
}

#Priivaate Subnet
resource "google_compute_subnetwork" "private_subnet" {
  name          = format("%s-%s-private", var.project_name, var.environment_map[var.target_env])
  ip_cidr_range = var.pvt_ip_cidr_range
  region        = var.region
  network       = google_compute_network.my-vpc_network.id
  private_ip_google_access = var.private_ip_google_access
}

resource "google_compute_firewall" "gcp-my-firewall" {
  name    = format("%s-%s-firewall", var.project_name, var.environment_map[var.target_env])
  network = google_compute_network.my-vpc_network.name

  allow {
    protocol = var.protocols[0]
  }

  allow {
    protocol = var.protocols[1]
    ports    = var.ports
  }

  source_tags = var.source_tags
}

# #Cloud Router
# resource "google_compute_router" "public" {
#   name    = "vpc-my-router"
#   network = google_compute_network.vpc_network.name
#   bgp {
#     asn               = 64514
#     advertise_mode    = "CUSTOM"
#   }
# }
# #Router NAT
# data "google_compute_router_nat" "my-NAT" {
#   name = "vpc-my-router-nat"
#   router = "vpc-my-router"
# }
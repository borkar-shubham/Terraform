resource "google_service_account" "default" {
  account_id   = "service_account_id"
  display_name = "Service Account"
}

resource "google_compute_instance" "server_1" {
  name         = "test"
  machine_type = "e2-medium"
  zone         = "us-central1-a"
  tags         = ["test", "myserver"]
  #   metadata_startup_script = "echo hi > /test.txt"    #user-data

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "vpc-1"
    access_config {
      // Ephemeral public IP
    }
  }

  #   // Local SSD disk
  #   scratch_disk {
  #     interface = "SCSI"
  #   }

  #   metadata = {
  #     foo = "bar"
  #   }

  #   service_account {
  #     # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
  #     email  = google_service_account.default.email
  #     scopes = ["cloud-platform"]
  #   }
}
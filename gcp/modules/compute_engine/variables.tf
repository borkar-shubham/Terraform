variable "project_name" {
  type = string
  default = "gcp-ecom"
}

variable "target_env" {
  type = string
  default = "DEV"
}

variable "environment_map" {
  type = map(string)
  default = {
    "DEV" = "dev",
    "QA" = "qa",
    "STAGE" = "stage",
    "PROD" = "prod"
  }
}
variable "machine_types" {
  type = map(string)
  default = {
    "DEV" = "e2-micro"
    "QA" = "e2-small"
    "STAGE" = "e2-medium"
    "PROD" = "e2-standard-2"

  }
}

variable "zone_name" {
  type = string
  default = "us-central1-a"
}

variable "tags" {
  type = list(string)
  default = ["http", "ssh"]
}

variable "image" {
  type = string
  default = "debian-cloud/debian-11"
}

variable "network_interface" {
  type = string
  default = "default"
}

# variable "environment_instance_settings" {
#   type = map(object({machine_type=string, tags=list(string)}))
#   default = {
#     "DEV" = {
#       machine_type = "e2-micro"
#       tags = ["dev"]
#     },
#     "QA" = {
#       machine_type = "e2-small"
#       tags = ["qa"]
#     },
#     "STAGE" = {
#       machine_type = "e2-medium"
#       tags = ["stage"]
#     },
#     "PROD" = {
#       machine_type = "e2-standard-2"
#       tags = ["prod"]
#     }
#   }
# }
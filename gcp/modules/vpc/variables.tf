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

variable "region" {
  type = string
  default = "us-central1"
}

variable "pub_ip_cidr_range" {
  type = string
  default = "198.168.1.0/24"
}

variable "pvt_ip_cidr_range" {
  type = string
  default = "198.168.2.0/24"
}

variable "private_ip_google_access" {
  type = bool
  default = true
}

variable "protocols" {
  type = list(string)
  default = [ "icmp", "tcp" ]
}

variable "ports" {
  type = list(string)
  default = ["22","80", "8080", "1000-2000"]
}

variable "source_tags" {
  type = list(string)
  default = [ "web", "http", "ssh" ]

}

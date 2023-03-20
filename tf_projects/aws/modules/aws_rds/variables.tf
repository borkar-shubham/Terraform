variable "db_identifier" {
  type    = string
  default = "tf-db"
}
variable "db_engine" {
  type = string
}
# variable "engine_version" {
#   type = string
# }
variable "instance_class" {
  type = string
}
variable "username" {
  type = string
}
variable "password" {
  type      = string
  sensitive = true
}
variable "db_security_group" {
  type = list(string)
}
variable "subnet_ids" {
  type = list(string)
}
variable "tags" {
  type = map(any)
  default = {
    "env" = "production"
  }
}
variable "env" {
  type = string
  default = "test"
}
variable "namespace" {
  type = string
  default = "my-project"
}
# variable "availability_zone" {
#   default = "us-east-1c"
# }
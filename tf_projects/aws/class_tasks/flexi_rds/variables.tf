variable "db_identifier" {
  type    = string
  default = "tf-db"
}
variable "db_engine" {
  type = list(string)
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
# variable "db_security_group" {
#   type = list(string)
# }
# variable "subnet_ids" {
#   type = list(string)
# }

//VPC variables
variable "env" {
  type = string
}
variable "namespace" {
  type = string
}
variable "vpc_cidr" {
  type = string
}
variable "pub_sub_cidr" {
  type = list(string)
}
variable "pvt_sub_cidr" {
  type = list(string)
}
variable "availability_zone" {
  type = list(string)
}
variable "ingress" {
  type = any
}
variable "tags" {
  type = map(any)
}
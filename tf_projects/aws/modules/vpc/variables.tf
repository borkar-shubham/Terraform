//VPC variables
variable "vpc_name" {
  type = string
  default = "tf_vpc"
}
# variable "vpc_id" {
#   type = string
# }
variable "vpc_cidr" {
  type = string
  default = "192.168.0.0/24"
}
variable "pub_sub_cidr" {
  type = string
  default = "192.168.0.0/25"
}
variable "pvt_sub_cidr" {
  type = string
  default = "192.168.0.128/25"
}
variable "ports" {
  type = list(number)
  default = [22, 80, 443, 8080, 3306]
}
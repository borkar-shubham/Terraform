//VPC variables
variable "vpc_name" {
  type    = string
  default = "tf_vpc"
}
# variable "vpc_id" {
#   type = string
# }
variable "vpc_cidr" {
  type    = string
  default = "192.168.0.0/24"
}
variable "pub_sub_cidr" {
  type    = list(any)
  default = ["192.168.0.0/26", "192.168.0.64/26"]
}
variable "pvt_sub_cidr" {
  type    = list(any)
  default = ["192.168.0.128/26", "192.168.0.192/26"]
}
variable "availability_zones" {
  type    = list(any)
  default = ["us-east-1a", "us-east-1b"]
}
variable "ports" {
  type    = list(number)
  default = [22, 80, 443, 8080, 3306]
}
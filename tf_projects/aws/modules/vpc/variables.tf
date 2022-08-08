//VPC variables
variable "vpc_name" {
  type = string
}
variable "vpc_id" {
}
variable "vpc_cidr" {
  type = string
}
variable "pub_sub_cidr" {
  type = string
}
variable "pvt_sub_cidr" {
  type = string
}
variable "ports" {
  type = list(number)
}
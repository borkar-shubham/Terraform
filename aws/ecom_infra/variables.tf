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

//eks variables
variable "cluster_name" {
  type = string
}
variable "node_group_name" {
  type = string
}
variable "desired_size" {
  type = number
}
variable "max_size" {
  type = number
}
variable "min_size" {
  type = number
}
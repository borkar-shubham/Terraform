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

//loadbalancer variables
variable "lb_type" {
  type = string
}
variable "security_groups" {
  type = list(any)
}
variable "subnets" {
  type = list(any)
}
variable "vpc_id" {
  type = string
}
variable "tg" {
  type = any
}
variable "" {
  type = string
}
//efs variables
variable "performance_mode" {
  type = string
}
variable "throughput_mode" {
  type = string
}
variable "encrypted" {
  type = bool
}

//vpc variables
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
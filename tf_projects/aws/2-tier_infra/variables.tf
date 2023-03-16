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
  type = string
}
variable "pvt_sub_cidr" {
  type = string
}
variable "availability_zone" {
  type = string
}
variable "ingress" {
  type = any
}
variable "tags" {
  type = map(any)
}

//DB variables
variable "db_identifier" {
  type = string
}
variable "db_engine" {
  type = string
}
variable "engine_version" {
  type = string
}
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

//application variables
variable "lt_name" {
  type = string
}
variable "lb_name" {
  type = string
}
variable "asg_name" {
  type = string
}
variable "min_size" {
  type = number
}
variable "max_size" {
  type = number
}
variable "desired_capacity" {
  type = number
}
variable "tg_name" {
  type = string
}
variable "tg_port" {
  type = string
}
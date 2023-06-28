//ec2_instance variables
variable "web_tier_name" {
  type = string
}
variable "app_tier_name" {
  type = string
}
variable "web_tier_image_name" {}
variable "app_tier_image_name" {}

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

//autoscaling & load_balancer variables
variable "lt_name" {
  type = list(string)
}
variable "asg_name" {
  type = list(string)
}
variable "min_size" {
  type = list(number)
}
variable "max_size" {
  type = list(number)
}
variable "desired_capacity" {
  type = list(number)
}
variable "tg_name" {
  type = list(string)
}
variable "tg_port" {
  type = list(string)
}
variable "lb_name" {
  type = list(string)
}

//database variables
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
  type = string
}





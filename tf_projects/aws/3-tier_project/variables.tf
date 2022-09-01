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
variable "ports" {
  type = list(number)
}

//autoscaling & load_balancing variables
variable "lt_name" {
  type = list(string)
}
variable "asg_name" {
  type = list(string)
}
# variable "vpc_zone" {
#   type = list(any)
# }
# variable "vpc_id" {
# }
variable "tg_name" {
  type = list(string)
}
variable "tg_port" {
  type = list(number)
}
variable "lb_name" {
  type = list(string)
}
# variable "security_groups" {
#   type = list(any)
# }







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
variable "key_pair_name" {  
}
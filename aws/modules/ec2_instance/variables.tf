//Instance variables
variable "instance_name" {
  type = string
}

# variable "image_id" {
#   type        = string
#   description = "This is the Ubuntu image for Virginia"
# }

variable "image_name" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "key_pair_name" {
  type    = string
  default = "tf_key_pair"
}

variable "subnet_id" {
  type = string
}

variable "vpc_security_group_ids" {
  type = list(any)
  #default = ["aws_security_group.tf_vpc_sg_id"]

}

# variable "access_key" {
#     type = string
# }
# variable "secret_key" {
#     type = string
# }
# //use these variables if you put separate access_key & secret_key instead of providing a "profile" section in provider.

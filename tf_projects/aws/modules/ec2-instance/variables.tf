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
  type = string
}

variable "ports" {
  type = list(number)
}

variable "key_pair_name" {
  type = string
}

# variable "access_key" {
#     type = string
# }
# variable "secret_key" {
#     type = string
# }
# //use these variables if you put separate access_key & secret_key instead of providing a "profile" section in provider.

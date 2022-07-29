variable "image_id" {
    type = string
    description = "This is the Ubuntu image for Virginia"
}
variable instance_type {
    type = string
}

variable "ports" {
    type = list(number)
}
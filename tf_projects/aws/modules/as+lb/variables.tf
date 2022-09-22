//launch_template variables
variable "lt_name" {
  default = "prod_lt-1"
}
variable "image_id" {
  default = "ami-08d4ac5b634553e16"
}
variable "instance_type" {
  default = "t2.micro"
}
variable "key_pair_name" {
  default = "auto_scaling_key"
}
# variable "lt_user_data" {
#   default = filebase64("${path.module}/user-data.sh") 
# }
# variable "security_groups" {
#     default = ["sg-0cf81af39dfee1ba7"]

# }

//AS variables
variable "asg_name" {
  default = "demo_asg"
}
variable "min_size" {
  default = "1"
}
variable "max_size" {
  default = "3"
}
variable "desired_capacity" {
  default = "2"
}
variable "vpc_zone" {
  type    = list(any)
  default = ["subnet-030dd317fa436be81", "subnet-0c2d67e1ceedbfe0d", "subnet-082b7a3e0fda8c1bb"]
}

//TG variables
variable "tg_name" {
  default = "demo-tg"
}
variable "tg_port" {
  default = "80"
}
variable "vpc_id" {
  default = "vpc-02a95381b19da3c18"
}

//ALB variables
variable "lb_name" {
  default = "demo-alb"
}
variable "lb_type" {
  default = "application"
}
variable "security_groups" {
  type    = list(any)
  default = ["sg-0cf81af39dfee1ba7"]
}
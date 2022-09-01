# data "aws_vpc" "default_vpc" {
#     filter {
#       name   = "tag:Name"
#       values = ["Default"]
#     }
# }

data "template_file" "user_data" {
  template = file("${path.module}/user-data.sh")
}

# data "aws_subnets" "default_vpc_subnets" {
#   filter {
#     name   = "tag:Name"
#     values = ["*"]
#   }
# }

# data "aws_security_groups" "default_vpc_sg" {
#     filter {
#       name = "tag:Name"
#       values = ["*"]
#     }
# }
# data "aws_vpc" "tf_vpc" {
#     filter {
#       name   = "tag:Name"
#       values = ["tf_vpc"]
#     }
  
# }

# data "aws_subnets" "vpc-1_subnets" {
#   filter {
#     name   = "tag:Name"
#     values = ["vpc-1_public.sub*"]
#   }
# }

# data "aws_security_groups" "vpc-1_sg" {
#     filter {
#       name = "tag:Name"
#       values = ["vpc-1-sg"]
#     }
# }
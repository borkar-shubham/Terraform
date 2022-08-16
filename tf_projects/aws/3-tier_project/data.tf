# data "aws_subnet" "pub_sub" {
#   filter {
#     name   = "tag:Name"
#     values = [var.pub_subnet_name]
#   }
# }
# data "aws_subnet" "pvt_sub" {
#   filter {
#     name   = "tag:Name"
#     values = [var.pvt_subnet_name]
#   }
# }
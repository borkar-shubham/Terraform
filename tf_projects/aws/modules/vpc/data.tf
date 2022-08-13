# data "aws_subnet" "public" {
#   filter {
#     name   = "tag:name"
#     values = ["(${var.vpc_name}).pub.sub"]
#   }
# }

# data "aws_subnet" "private" {
#   filter {
#     name   = "tag:name"
#     values = ["(${var.vpc_name}).pvt.sub"]
#   }
# }
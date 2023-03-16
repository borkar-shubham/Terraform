# //for loop
# subnet_mapping {
#   subnet_id = ""
# }
# subnets = [for subnet in aws_subnet.public : subnet.id]
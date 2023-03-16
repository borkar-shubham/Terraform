# //dynamic block example: map type
# dynamic "ingress" {
#   for_each = var.ports
#   iterator = port
#   content {
#     description = "Allows given traffic from VPC"
#     from_port   = port.value
#     to_port     = port.value
#     protocol    = "tcp" #allows tcp, udp and other all protocols
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }

# variable "ingress" {
#   type = any
# }

# ingress = {
#   ssh = {
#     port = 22
#   },
#   http = {
#     description = "http connection"
#     port        = 80
#   },
#   https = {
#     description = "Secure HTTPS from VPC"
#     port        = 443
#     cidr_blocks = ["172.25.0.0/20"]
#   },
#   tomcat = {
#     port = 8080
#   },
#   mysql = {
#     port = 3306
#   }
# }
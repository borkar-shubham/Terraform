//creating security group
resource "aws_security_group" "terraform-sg" {
  name        = "terraform-sg"
  description = "Allow TLS inbound traffic"

  dynamic "ingress" {
    for_each = "${var.ports}"
    iterator = port
    content {
      description = "TLS from VPC"
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}
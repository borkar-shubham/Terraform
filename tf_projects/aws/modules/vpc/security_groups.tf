//creating security group
resource "aws_security_group" "tf_vpc_sg" {
  name        = "(${var.vpc_name})_sg"
  description = "Allow public connectivity"
  vpc_id      = aws_vpc.tf_vpc.id

  dynamic "ingress" {
    for_each = var.ports
    iterator = port
    content {
      description = "Allows given traffic from VPC"
      from_port   = port.value
      to_port     = port.value
      protocol    = "-1" #allows tcp, udp and other all protocols
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    description = "Allows all traffic"
  }
}
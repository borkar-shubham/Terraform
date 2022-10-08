//creating security group
resource "aws_security_group" "tf_vpc_sg" {
  name        = format("%s-%s-sg", var.namespace, var.env)
  description = "Allow public and private TCP connectivity"
  vpc_id      = aws_vpc.tf_vpc.id

  dynamic "ingress" {
    for_each = var.ingress
    # iterator = port
    content {
      description = lookup(ingress.value, "description", null)
      from_port   = lookup(ingress.value, "port", "22")
      to_port     = lookup(ingress.value, "port", "22")
      protocol    = lookup(ingress.value, "protocol", "tcp") #allows tcp, udp and other all protocols
      cidr_blocks = lookup(ingress.value, "cidr_blocks", ["0.0.0.0/0"])
    }
  }
  ingress { //Allowing all icmp protocols for pinging
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    description      = "Allows all traffic"
  }
}
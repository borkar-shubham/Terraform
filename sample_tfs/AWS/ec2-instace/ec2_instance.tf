terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-east-1"
  profile = "sachin"
}

//creating ssh-key pair
resource "aws_key_pair" "virginia-key-terraform" {
  key_name   = "virginia-key-terraform"
  public_key = file("${path.module}/id_rsa.pub")
}

//creating security group
resource "aws_security_group" "terraform-sg" {
  name        = "terraform-sg"
  description = "Allow TLS inbound traffic"

  dynamic "ingress" {
    for_each = [22, 80, 443, 3306]
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

resource "aws_instance" "app_server" {
  ami             = "ami-08d4ac5b634553e16"
  instance_type   = "t2.micro"
  key_name        = "${aws_key_pair.virginia-key-terraform.key_name}"
  vpc_security_group_ids = ["${aws_security_group.terraform-sg.id}"]
  tags = {
    Name = "Application Server-1"
  }
}
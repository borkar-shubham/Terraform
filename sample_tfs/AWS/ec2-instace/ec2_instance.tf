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

resource "aws_instance" "app_server" {
  ami             = "ami-08d4ac5b634553e16"
  instance_type   = "t2.micro"
  key_name        = "${aws_key_pair.virginia-key-terraform.key_name}"
  vpc_security_group_ids = ["${aws_security_group.terraform-sg.id}"]
  tags = {
    Name = "Application Server-1"
  }
}
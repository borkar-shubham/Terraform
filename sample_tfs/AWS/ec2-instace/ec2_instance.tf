terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

resource "aws_instance" "app_server" {
  ami             = "${var.image_id}"
  instance_type   = "${var.instance_type}"
  key_name        = "${aws_key_pair.virginia-key-terraform.key_name}"
  vpc_security_group_ids = ["${aws_security_group.terraform-sg.id}"]
  tags = {
    Name = "Application Server-1"
    Env = "Testing"
    Provision = "Terraform"
  }
}
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]
  filter {
    name   = "name"
    values = ["${var.image_name}"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

resource "aws_instance" "application_server" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  key_name               = var.key_pair_name
  vpc_security_group_ids = ["${aws_security_group.tf_vpc_sg.id}"]
  subnet_id              = aws_subnet.tf_vpc_pub_sub.id
  user_data              = file("${path.module}/user_data.sh")
  tags = {
    Name      = "Application_Server"
    Env       = "Testing"
    Provision = "Terraform"
  }


  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("${path.module}/id_rsa")
    host        = self.public_ip #self is mentioned to avoid infinite loop between instance and provisioner.
  }
}

//terraform backend to store the tfstate file in remote storage for collaborative environment.
//also avoid simultaneous tf apply with help of backed locking with dynamodb_table
# terraform {
#   backend "s3" {
#     bucket = "gaurav-youtube-tf"
#     region = "us-east-1"
#     key="terraform.tfstate"
#     dynamodb_table = "gaurav-youtube-tf-table"
#   }
# }
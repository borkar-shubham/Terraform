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

data "aws_subnet" "public"{
  filter {
    nname = "tag:name"
    values = ["(${var.vpc_name}).pub.sub"]
  }
}

data "aws_subnet" "private"{
  filter {
    nname = "tag:name"
    values = ["(${var.vpc_name}).pvt.sub"]
  }
}
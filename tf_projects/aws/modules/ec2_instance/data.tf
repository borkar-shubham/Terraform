//AMI Imaage
data "aws_ami" "ubuntu_latest" {
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

//IAM Role
# data "aws_iam_instance_profile" "ec2_role" {
#   name = ec2_role_s3full
# }

//Availability Zone
# data "aws_availability_zone" "az" {
#   name                   = "us-east-1a"
#   all_availability_zones = false
#   state                  = "available"
# }

//Existing Key_Pair
# data "aws_key_pair" "keypair" {
#   key_name = "<key_name>"
# }

//Subnet for Instance
# data "aws_subnet" "public1" {
#   vpc_id            = "vpc-00a12ba024df248f2"
#   availability_zone = "us-east-1a"
#   filter {
#     name   = "tag:Name"
#     values = ["vpc-1_public.sub"]
#   }
# }

//Existing SG
# data "aws_security_groups" "sg" {
#   tags = {
#     Name = ""
#   }
# }
provider "aws" {
  region = "us-east-1"
}
module "ec2_instance" {
  source        = "../modules/ec2_instance"
  instance_name = "docker-server"
  instance_type = "t2.micro"
  image_name    = "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"
  key_pair_name = "tf_key_pair"
  subnet_id     = module.vpc.tf_vpc_pub_sub_id
}

module "vpc" {
  source       = "../modules/vpc"
  vpc_name     = "tf_vpc"
  vpc_id       = module.vpc.vpc_id
  vpc_cidr     = "192.168.0.0/24"
  pub_sub_cidr = "192.168.0.0/25"
  pvt_sub_cidr = "192.168.0.128/25"
  ports        = [22, 80, 443, 8080, 3306]
}

# module "security_groups" {
#   source = "../modules/vpc"
#   vpc_id = module.vpc.vpc_id
# }
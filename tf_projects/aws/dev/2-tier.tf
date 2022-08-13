provider "aws" {
  region = "us-east-1"
}
module "ec2_instance" {
  source        = "../modules/ec2_instance"
  
  subnet_id     = module.vpc.tf_vpc_pub_sub_id
}

module "vpc" {
  source       = "../modules/vpc"
  
}

# module "security_groups" {
#   source = "../modules/vpc"
#   vpc_id = module.vpc.vpc_id
# }
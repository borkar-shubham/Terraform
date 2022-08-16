provider "aws" {
  region = "us-east-1"
}

module "Web_Server" {
  source        = "../modules/ec2_instance"
  instance_name = var.web_tier_name
  image_name    = var.web_tier_image_name
  subnet_id     = module.vpc.tf_vpc_pub_sub_id
  user_data     = file("${path.module}/nginx.sh")
  #vpc_security_group_ids = [module.vpc.tf_vpc_sg_id]

  # tags = {
  #   Name = var.web_tier
  #   Env  = "Testing"
  # }
}

module "Application_Server" {
  source        = "../modules/ec2_instance"
  instance_name = var.app_tier_name
  image_name    = var.app_tier_image_name
  subnet_id     = module.vpc.tf_vpc_pvt_sub_id
  user_data     = file("${path.module}/tomcat.sh")
  #vpc_security_group_ids = [module.vpc.tf_vpc_sg_id]
}

module "vpc" {
  source = "../modules/vpc"
  ports  = var.ports
}

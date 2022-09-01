# module "Web_Server" {
#   source        = "../modules/ec2_instance"
#   instance_name = var.web_tier_name
#   image_name    = var.web_tier_image_name
#   subnet_id     = module.vpc.tf_vpc_pub_sub_id
#   #user_data     = file("${path.module}/nginx.sh")
#   vpc_security_group_ids = [module.vpc.tf_vpc_sg_id]

#   # tags = {
#   #   Name = var.web_tier
#   #   Env  = "Testing"
#   # }
# }
# module "Application_Server" {
#   source        = "../modules/ec2_instance"
#   instance_name = var.app_tier_name
#   image_name    = var.app_tier_image_name
#   subnet_id     = module.vpc.tf_vpc_pvt_sub_id
#   #user_data     = file("${path.module}/tomcat.sh")
#   vpc_security_group_ids = [module.vpc.tf_vpc_sg_id]
# }

module "vpc" {
  source = "../modules/vpc"
  ports  = var.ports
}

module "web_tier" {
  source          = "../modules/as+lb"
  lt_name         = var.lt_name[0]
  lb_name         = var.lb_name[0]
  asg_name        = var.asg_name[0]
  vpc_zone        = module.vpc.tf_vpc_pub_sub_ids
  vpc_id          = module.vpc.tf_vpc_id
  security_groups = [module.vpc.tf_vpc_sg_id]
  tg_name         = var.tg_name[0]
  tg_port         = var.tg_port[0]
}

module "app_tier" {
  source          = "../modules/as+lb"
  lt_name         = var.lt_name[1]
  lb_name         = var.lb_name[1]
  asg_name        = var.asg_name[1]
  vpc_zone        = module.vpc.tf_vpc_pvt_sub_ids
  vpc_id          = module.vpc.tf_vpc_id
  security_groups = [module.vpc.tf_vpc_sg_id]
  tg_name         = var.tg_name[1]
  tg_port         = var.tg_port[1]
}

module "db_tier" {
  source = "../modules/aws_rds"
  db_identifier = var.db_identifier
  db_security_group = [module.vpc.tf_vpc_sg_id]
  subnet_ids = module.vpc.tf_vpc_pvt_sub_ids
  # availability_zone = "us-east-1b"
}
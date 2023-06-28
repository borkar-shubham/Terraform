# module "Web_Server" {
#   source        = "../modules/ec2_instance"
#   instance_name = var.web_tier_name
#   image_name    = var.web_tier_image_name
#   subnet_id     = module.vpc.tf_vpc_pub_sub_ids[0]
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
#   subnet_id     = module.vpc.tf_vpc_pvt_sub_ids[1]
#   #user_data     = file("${path.module}/tomcat.sh")
#   vpc_security_group_ids = [module.vpc.tf_vpc_sg_id]
# }

module "vpc" {
  source            = "../modules/vpc"
  ingress           = var.ingress
  env               = var.env
  namespace         = var.namespace
  vpc_cidr          = var.vpc_cidr
  pub_sub_cidr      = var.pub_sub_cidr
  pvt_sub_cidr      = var.pvt_sub_cidr
  availability_zone = var.availability_zone
  tags              = var.tags
}

module "web_tier" {
  source           = "../modules/aws_ec2_as_lb"
  lt_name          = var.lt_name[0]
  lb_name          = var.lb_name[0]
  asg_name         = var.asg_name[0]
  min_size         = var.min_size[0]
  max_size         = var.max_size[0]
  desired_capacity = var.desired_capacity[0]
  vpc_zone         = module.vpc.pub_sub_ids
  vpc_id           = module.vpc.vpc_id
  security_groups  = [module.vpc.security_group_id]
  tg_name          = var.tg_name[0]
  tg_port          = var.tg_port[0]
}

module "app_tier" {
  source           = "../modules/aws_ec2_as_lb"
  lt_name          = var.lt_name[1]
  lb_name          = var.lb_name[1]
  asg_name         = var.asg_name[1]
  min_size         = var.min_size[1]
  max_size         = var.max_size[1]
  desired_capacity = var.desired_capacity[0]
  vpc_zone         = module.vpc.pvt_sub_ids
  vpc_id           = module.vpc.vpc_id
  security_groups  = [module.vpc.security_group_id]
  tg_name          = var.tg_name[1]
  tg_port          = var.tg_port[1]
}

module "db_tier" {
  source            = "../modules/aws_rds"
  db_identifier     = var.db_identifier
  db_engine         = var.db_engine
  engine_version    = var.engine_version
  instance_class    = var.instance_class
  username          = var.username
  password          = var.password
  db_security_group = [module.vpc.security_group_id]
  subnet_ids        = module.vpc.pvt_sub_ids
  # availability_zone = "us-east-1b"
}
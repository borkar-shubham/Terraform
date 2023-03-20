//VPC 
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

// DB-Tier
module "db_tier" {
  source            = "../modules/aws_rds"
  db_identifier     = var.db_identifier
  db_engine         = var.db_engine
  # engine_version    = var.engine_version
  instance_class    = var.instance_class
  username          = var.username
  password          = var.password
  db_security_group = [module.vpc.security_group_id]
  subnet_ids        = module.vpc.pvt_sub_ids
  # availability_zone = "us-east-1b"
  env              = var.env
  namespace        = var.namespace
  tags             = var.tags
}

//Application Tier
module "app_tier" {
  source           = "../modules/aws_ec2_as_lb"
  lt_name          = var.lt_name
  lb_name          = var.lb_name
  asg_name         = var.asg_name
  min_size         = var.min_size
  max_size         = var.max_size
  desired_capacity = var.desired_capacity
  vpc_zone         = module.vpc.pub_sub_ids
  vpc_id           = module.vpc.vpc_id
  security_groups  = [module.vpc.security_group_id]
  tg_name          = var.tg_name
  tg_port          = var.tg_port
  env              = var.env
  namespace        = var.namespace
  tags             = var.tags
}
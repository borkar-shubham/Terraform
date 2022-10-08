module "vpc" {
  source            = "../../modules/vpc"
  env               = var.env
  namespace         = var.namespace
  vpc_cidr          = var.vpc_cidr
  pub_sub_cidr      = var.pub_sub_cidr
  pvt_sub_cidr      = var.pvt_sub_cidr
  availability_zone = var.availability_zone
  ingress           = var.ingress
  tags              = var.tags
}
module "flexi_rds" {
  source    = "../../modules/aws_rds"
  for_each  = toset(var.db_engine)
  db_engine = each.value
  # engine_version    = var.engine_version
  username          = var.username
  password          = var.password
  instance_class    = var.instance_class
  db_security_group = [module.vpc.security_group_id]
  subnet_ids        = module.vpc.pvt_sub_ids
  tags              = var.tags
  env               = var.env
  namespace         = var.namespace
}
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

module "efs" {
  source           = "../modules/aws_efs"
  performance_mode = var.performance_mode
  throughput_mode  = var.throughput_mode
  encrypted        = var.encrypted
  subnet_id        = module.vpc.pub_sub_ids
  security_groups  = [module.vpc.security_group_id]
  tags             = var.tags
  env              = var.env
  namespace        = var.namespace
  depends_on = [
    module.vpc
  ]
}

module "as_lb" {
  source    = "../modules/aws_ec2_as_lb"
  tags      = var.tags
  env       = var.env
  namespace = var.namespace
  depends_on = [
    module.efs
  ]
}
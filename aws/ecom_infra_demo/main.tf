module "tf_vpc" {
  source              = "../modules/vpc"
  env                 = var.env
  namespace           = var.namespace
  cidr_block          = var.vpc_cidr
  private_cidr_blocks = var.pub_sub_cidr
  public_cidr_blocks  = var.pvt_sub_cidr
  availability_zone   = var.availability_zone
  ingress             = var.ingress
  tags                = var.tags
}

module "lb" {
  source          = "../modules/load_balancer"
  env             = var.env
  namespace       = var.namespace
  lb_type         = var.lb_type
  security_groups = [module.vpc.security_group_id]
  subnets         = module.tf_vpc.pub_sub
  vpc_id          = module.tf_vpc.vpc_id
  tg              = var.tg
  tags            = var.tags
}
//VPC module
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

//eks module
module "eks_cluster" {
  source     = "../modules/aws_eks"
  subnet_ids = [module.tf_vpc.pub_sub_ids]
}

module "rt_53" {
  source           = "../../modules/aws_rt-53"
  domain_name      = var.domain_name
  record_type      = var.record_type
  aws_elb_dns_name = var.aws_elb_dns_name
  aws_elb_zone_id  = var.aws_elb_zone_id
}
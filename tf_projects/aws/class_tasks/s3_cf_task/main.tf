module "s3" {
  source     = "../modules/aws_s3"
  s3_buckets = var.s3_buckets
}
module "cloudfront" {
  source      = "../modules/cloudfront"
  domain_name = module.s3.website_domain
}
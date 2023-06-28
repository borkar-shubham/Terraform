module "s3_cf" {
  source    = "./s3_cloudfront"
  for_each  = toset(var.s3_bucket)
  s3_bucket = each.value
  env       = var.env
}
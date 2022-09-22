module "s3_mod" {
  source = "../modules/aws_s3"
  s3_buckets = var.s3_bucket
}

variable "s3_bucket" {
  type = list(any)
}
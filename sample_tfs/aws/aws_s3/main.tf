terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"
}

variable "s3_buckets" {
  type    = list(any)
  default = ["tf-bucket1","tf-bucket2","tf-bucket3","tf-bucket4","tf-bucket5","tf-bucket6","tf-bucket7","tf-bucket8","tf-bucket9","tf-bucket10"]
}

resource "aws_s3_bucket" "tf-buckets" {
  count  = length(var.s3_buckets) //count will be 3
  bucket = var.s3_buckets[count.index]
  acl           = "private"
  #region        = "us-east-1"
  force_destroy = true
}
# resource "aws_s3_bucket_acl" "s3_acl" {
#     acl    = "private"
#     count  = length(var.s3_buckets)
#     bucket = "aws_s3_bucket.tf_buckets[count.index]"

# }
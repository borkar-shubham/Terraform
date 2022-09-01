variable "s3_buckets" {
  type    = list(any)
  default = ["prod-cl-bucket", "dev-cl-bucket", "test-cloud-bucket", "uat-cl-bucket", "uat-cloudblitz-bucket", "my-cl-bucket", "my-cloudblitz-bucket"]
}

resource "aws_s3_bucket" "tf-buckets" {
  count  = length(var.s3_buckets) //count will be 3
  bucket = var.s3_buckets[count.index]
  acl    = "private"
  # region        = "us-west-2"
  force_destroy = true
}
# resource "aws_s3_bucket_acl" "s3_acl" {
#     acl    = "private"
#     count  = length(var.s3_buckets)
#     bucket = "aws_s3_bucket.tf_buckets[count.index]"

# }
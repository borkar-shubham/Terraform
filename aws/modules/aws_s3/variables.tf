variable "s3_buckets" {
  type    = list(string)
  default = ["prod-cl-bucket", "dev-cl-bucket", "test-cloud-bucket", "uat-cl-bucket"]
}
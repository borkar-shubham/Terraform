output "website_domain" {
  value = aws_s3_bucket.tf-buckets[*].bucket_regional_domain_name
}
data "aws_iam_policy_document" "s3_policy" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.bucket-website-static.arn}/*"]

    principals {
      type        = "AWS"
      identifiers = [aws_cloudfront_origin_access_identity.myoai.iam_arn]
    }
  }
}

# data "aws_s3_bucket" "static_web_bucket" {
#   bucket = "bucket-website-static"
# }
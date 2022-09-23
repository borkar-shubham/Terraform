data "aws_iam_policy_document" "tf-buckets-policy-doc" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    effect = "Allow"
    actions = [
      "s3:GetObject",
      #"s3:ListBucket",
    ]
    resources = [
      aws_s3_bucket.tf-buckets.arn,
      "${aws_s3_bucket.tf-buckets.arn}/*",
    ]
  }
}
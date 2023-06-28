resource "aws_s3_bucket" "tf-buckets" {
  count  = length(var.s3_buckets)
  bucket = var.s3_buckets[count.index]
  acl    = "private"
  # region        = "us-west-2"
  force_destroy = true
  versioning {
    enabled = false
  }
}
# resource "aws_s3_bucket_acl" "s3_acl" {
#     acl    = "private"
#     count  = length(var.s3_buckets)
#     bucket = "aws_s3_bucket.tf_buckets[count.index]"
# }

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
      aws_s3_bucket.tf-buckets[count.index].arn,
      "${aws_s3_bucket.tf-buckets.arn}/*"
    ]
  }
}
resource "aws_s3_bucket_policy" "tf-buckets-policy" {
  bucket = aws_s3_bucket.tf-buckets[count.index].id
  policy = data.aws_iam_policy_document.tf-buckets-policy-doc.json
}

//S3 static website configurations.......
resource "aws_s3_object" "index_file" {
  count        = length(var.s3_buckets)
  bucket       = var.s3_buckets[count.index] # OR aws_s3_bucket.tf-buckets.bucket
  key          = "index.html"
  source       = "./index.html"
  content_type = "text/html"
}

resource "aws_s3_object" "error_file" {
  count        = length(var.s3_buckets)
  bucket       = var.s3_buckets[count.index]
  key          = "error.html"
  source       = "./error.html"
  content_type = "text/html"
}

resource "aws_s3_bucket_website_configuration" "my_static_website" {
  count  = length(var.s3_buckets)
  bucket = var.s3_buckets[count.index]

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

  routing_rule {
    condition {
      key_prefix_equals = "docs/"
    }
    redirect {
      replace_key_prefix_with = "documents/"
    }
  }
}

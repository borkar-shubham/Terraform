resource "aws_s3_bucket" "mybucket" {
  bucket = var.s3_bucket
  #acl    = "public-read"

  versioning {
    enabled = false
  }

  # website {
  #   index_document = "index.html"
  #   error_document = "error.html"
  # }
}

//s3 bucket policy
# data "aws_iam_policy_document" "mybucket_policy" {
#   statement {
#     principals {
#       type        = "AWS"
#       identifiers = ["*"]
#     }
#     effect = "Allow"
#     actions = [
#       "s3:GetObject",
#       #"s3:ListBucket",
#     ]
#     resources = [
#       aws_s3_bucket.mybucket.arn,
#       "${aws_s3_bucket.mybucket.arn}/*",
#     ]
#   }
# }

# resource "aws_s3_bucket_policy" "mybucket_policy" {
#   bucket = aws_s3_bucket.mybucket.id
#   policy = data.aws_iam_policy_document.mybucket_policy.json
# }

//S3 static website configurations....

resource "aws_s3_object" "index_file" {
  bucket       = aws_s3_bucket.mybucket.bucket
  key          = "index.html"
  source       = "./index.html"
  content_type = "text/html"
}

resource "aws_s3_object" "error_file" {
  bucket       = aws_s3_bucket.mybucket.bucket
  key          = "error.html"
  source       = "./error.html"
  content_type = "text/html"
}

resource "aws_s3_bucket_website_configuration" "my_static_website" {
  bucket = aws_s3_bucket.mybucket.bucket

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

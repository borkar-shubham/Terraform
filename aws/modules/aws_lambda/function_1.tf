provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_role" "s3_role_for_lambda" {
  name = "s3_role_for_lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}
# resource "aws_iam_role" "terraform_function_role" {
#   name               = "terraform_function_role"
#   assume_role_policy = "${data.aws_iam_policy_document.AWSLambdaTrustPolicy.json}"
# }

resource "aws_iam_role_policy_attachment" "s3_lambda_policy" {
  role       = aws_iam_role.s3_role_for_lambda.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

resource "aws_lambda_function" "mylambda" {
  function_name = "s3_lambda_function"
  role          = aws_iam_role.s3_role_for_lambda.arn
  runtime       = "nodejs16.x"
  handler       = "function.handler"
  filename      = "lambda_function.zip"
}
data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = "index.js"
  output_path = "lambda_function.zip"
}
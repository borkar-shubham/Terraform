# resource "aws_iam_user_policy" "iam_policy1" {
#   name = var.policy_name[s3read]
#   user = aws_iam_user.iam_user.name
#   policy = var.policy_s3read
# }

//inline policies
resource "aws_iam_user_policy" "inline_policy1" {
  name   = var.policy_name
  user   = aws_iam_user.iam_user.name // user attachment
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "ec2:Describe*"
      ],
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": [
         "s3:ListBucket"
      ],
        "Resource": "arn:aws:s3:::*"
      }
  ]
}
EOF
}

//directly attached policies
data "aws_iam_policy" "CloudWatchFullAccess" {
  name = "CloudWatchFullAccess"
}
data "aws_iam_policy" "AmazonRDSFullAccess" {
  name = "AmazonRDSFullAccess"
}

//policy attachments
resource "aws_iam_user_policy_attachment" "test-attchment1" {
  user       = aws_iam_user.iam_user.name
  policy_arn = data.aws_iam_policy.CloudWatchFullAccess.arn
}
resource "aws_iam_user_policy_attachment" "test-attchment2" {
  user       = aws_iam_user.iam_user.name
  policy_arn = data.aws_iam_policy.AmazonRDSFullAccess.arn
}

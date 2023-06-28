resource "aws_iam_user" "iam_user" {
  name = var.iam_user
  path = "/system/"

  tags = {
    dept = "testing"
  }
}

resource "aws_iam_access_key" "rohit" {
  user = aws_iam_user.iam_user.name
}

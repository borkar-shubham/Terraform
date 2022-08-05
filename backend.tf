//backend is used to store the tfstafe file at remote location so that everybody in the team can access it.
terraform {
  backend "s3" {
    bucket = "<s3-bucket>"
    region = "<bucket-region>"
    key="terraform.tfstate"      //custom key name can be put here.
    dynamodb_table = "<dynamodb_table_name>"
  }
}
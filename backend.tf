//terraform backend to store the tfstate file in remote storage for collaborative environment.
//also avoid simultaneous tf apply with help of backed locking with dynamodb_table
terraform {
  backend "s3" {
    bucket = "<s3-bucket>"
    region = "<bucket-region>"
    key="terraform.tfstate"      //custom key name can be put here.
    dynamodb_table = "<dynamodb_table_name>"
  }
}
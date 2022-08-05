provider "aws" {
  region  = "us-east-1"
  profile = "sachin" // This profile section is used to provide authentication for aws which is configured in aws cli. So we do not have to use the access_key and secret_key variables.
  //access_key = "${var.access_key}"
  //secret_key = "${var.secret_key}"
}

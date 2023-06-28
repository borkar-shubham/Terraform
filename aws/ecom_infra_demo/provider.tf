terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.31.0"
    }
  }
}

terraform {
  backend "s3" {
    bucket  = "ecom-infra-backend"
    key     = "ecom/test/terraform.tfstate"
    profile = "sachin"
    region  = "us-east-1"
  }
}

provider "aws" {
  profile = "sachin"
  region  = "us-east-1"
}
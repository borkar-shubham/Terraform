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
    bucket  = "3-tier-backend"
    key     = "3-tier/dev/terraform.tfstate"
    profile = "sachin"
    region  = "us-east-1"
  }
}

provider "aws" {
  profile = "sachin"
  region  = "eu-north-1"
}
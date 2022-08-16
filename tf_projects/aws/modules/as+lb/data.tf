data "aws_vpc" "vpc-1" {
    filter {
      name   = "tag:Name"
      values = ["vpc-1"]
    }
  
}

data "aws_subnets" "vpc-1_subnets" {
  filter {
    name   = "tag:Name"
    values = ["vpc-1_public.sub*"]
  }
}

data "aws_security_groups" "vpc-1_sg" {
    filter {
      name = "tag:Name"
      values = ["vpc-1-sg"]
    }
}
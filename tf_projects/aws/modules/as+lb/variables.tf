variable "key_pair_name" {
    type = string
    default = "three-tier-key"
}

variable "vpc_id" {
    type = string
    default = "aws_vpc.tf_vpc_id"
  
}
module "s3_mod" {
    source = "../modules/aws_s3"
}

variable "s3_bucket" {
    type = list
}
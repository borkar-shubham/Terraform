# variable "domain_name" {
#   type    = string
#   default = "bucket-website-static.s3-website.eu-north-1.amazonaws.com"
# }

variable "price_class" {
  type    = string
  default = "PriceClass_200"
}

variable "locations" {
  type    = list(string)
  default = ["US", "CA", "GB", "DE", "IN", "IR"]

}

variable "tags" {
  type = map(any)
  default = {
    env       = "test"
    bill_unit = "zshapr-102"
    owner     = "ecom"
    mail      = "shubhamb@greamio.com"
    team      = "DevOps"
  }

}
variable "domain_name" {
  type = any
}
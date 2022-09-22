variable "db_identifier" {
  type    = string
  default = "tf-db"
}
variable "db_engine" {
  type    = string
  default = "mysql"
}
variable "engine_version" {
  default = "8.0.28"
}
variable "instance_class" {
  default = "db.t3.micro"
}
# variable "db_subnet_group" {
#   type = list(string)
#   default = ["subnet-030dd317fa436be81", "subnet-0c2d67e1ceedbfe0d"]
# }
variable "username" {
  default = "admin"
}
variable "password" {
  default   = "admin123"
  sensitive = true
}
variable "db_security_group" {
  type    = list(any)
  default = ["sg-0cf81af39dfee1ba7"]
}
variable "subnet_ids" {
  type    = list(any)
  default = ["subnet-030dd317fa436be81", "subnet-0c2d67e1ceedbfe0d", "subnet-082b7a3e0fda8c1bb"]
}
# variable "availability_zone" {
#   default = "us-east-1c"
# }
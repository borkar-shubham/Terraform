variable "performance_mode" {
  type    = string
  default = "generalPurpose"
}
variable "throughput_mode" {
  type    = string
  default = "bursting"
}
variable "encrypted" {
  type    = bool
  default = true
}
variable "subnet_id" {
  type    = list(any)
  default = ["subnet-037268cd09d9ddd1f", "subnet-09ee3c60a8c5c773c"]
}
variable "security_groups" {
  type    = list(string)
  default = ["sg-0b60c5abb150b0f1d"]
}
variable "tags" {
  type = map(any)
  default = {
    "vpc" = "default"
  }
}
variable "namespace" {
  type    = string
  default = "demo_efs"
}
variable "env" {
  type    = string
  default = "test"
}
variable "env" {
  type = string
}
variable "namespace" {
  type = string
}
variable "lb_type" {
  type = string
}
variable "security_groups" {
  type = list(any)
}
variable "subnets" {
  type = list(any)
}
variable "vpc_id" {
  type = string
}
variable "tg" {
  type = any
}
variable "tags" {
  type = map(any)
}
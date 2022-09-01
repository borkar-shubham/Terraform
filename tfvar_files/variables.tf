variable "user" {
  type = string
}
variable "age" {
  type = number
}

output "name" {
  value = "Hello my name is ${var.user} and my age is ${var.age}"
}
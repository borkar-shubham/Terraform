variable "subnet_ids" {
  type    = list(string)
  default = [aws_subnet.example1.id, aws_subnet.example2.id]
}
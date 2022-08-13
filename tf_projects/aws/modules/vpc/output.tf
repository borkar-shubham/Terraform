output "vpc_id" {
  value = aws_vpc.tf_vpc.id
}

output "tf_vpc_pub_sub_id" {
  value = aws_subnet.tf_vpc_pub_sub.id
}
output "tf_vpc_pvt_sub_id" {
  value = aws_subnet.tf_vpc_pvt_sub.id
}
output "tf_vpc_sg_id" {
  value = aws_security_group.tf_vpc_sg.id
}

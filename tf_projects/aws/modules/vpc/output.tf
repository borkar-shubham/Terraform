output "vpc_id" {
  value = aws_vpc.tf_vpc.id
}
output "pub_sub_ids" {
  value = aws_subnet.tf_vpc_pub_sub.*.id #["${aws_subnet.tf_vpc_pub_sub.*.id}"]
}
output "pvt_sub_ids" {
  value = aws_subnet.tf_vpc_pvt_sub.*.id
}
output "security_group_id" {
  value = aws_security_group.tf_vpc_sg.id
}

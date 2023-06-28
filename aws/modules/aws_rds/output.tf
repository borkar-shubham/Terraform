output "db_instance_endpoint" {
  value = aws_db_instance.tf_db[*].endpoint
}

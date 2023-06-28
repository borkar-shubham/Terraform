output "efs_endpoint" {
  value = aws_efs_file_system.tf_efs.dns_name
}
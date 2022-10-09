resource "aws_efs_file_system" "tf_efs" {
  creation_token   = "efs"
  performance_mode = var.performance_mode
  throughput_mode  = var.throughput_mode
  encrypted        = var.encrypted

  tags = merge({
    Name = format("%s-%s-efs", var.namespace, var.env)
  }, var.tags)
}

resource "aws_efs_mount_target" "mount_target" {
  for_each        = toset(var.subnet_id)
  subnet_id       = each.value
  file_system_id  = aws_efs_file_system.tf_efs.id
  security_groups = var.security_groups
}

# resource "aws_efs_mount_target" "target" {
#   file_system_id = aws_efs_file_system.tf_efs.id
#   subnet_id      = var.subnet_id[1]
#   security_groups = var.security_groups
# }


# resource "aws_efs_mount_target" "efs-mt" {
#    count = length(data.aws_availability_zones.available.names)
#    file_system_id  = aws_efs_file_system.tf_efs.id
#    subnet_id = aws_subnet.subnet[count.index].id
#    security_groups = [aws_security_group.efs.id]
#  }

# data "aws_subnet_ids" "default" {
#   vpc_id = var.vpc_id
# }

# data "aws_subnet" "subnets" {
#   for_each = data.aws_subnet_ids.default.ids
#   id       = each.value
# }
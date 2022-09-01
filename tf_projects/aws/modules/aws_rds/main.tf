resource "aws_db_instance" "tf_db" {
  identifier           = "tf-db"
  allocated_storage    = 20
  engine               = var.db_engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  username             = var.username
  password             = var.password
  publicly_accessible  = false
  availability_zone    = "us-east-1c"
  # db_subnet_group_name = var.db_subnet_group
  vpc_security_group_ids = var.db_security_group
  skip_final_snapshot  = true
}

resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "My DB subnet group"
  }
}
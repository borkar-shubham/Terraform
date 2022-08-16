resource "aws_launch_template" "prod_lt" {
  name = "prod_lt"
  image_id = "ami-08d4ac5b634553e16"
  instance_type = "t2.micro"
  key_name = "virginia-ubuntu"
  #vpc_security_group_ids = ["sg-12345678"]    //exclude this when using lt for AS
  user_data = file("${path.module}/nginx.sh")  

#   iam_instance_profile {
#     name = "s3full_role_for_ec2"
#   }
  network_interfaces {
    associate_public_ip_address = true
  }
#   block_device_mappings {
#     device_name = "/dev/sda1"
#     ebs {
#       volume_size = 20
#     }
#   }
  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "Prod_Server"
    }
  }
#   instance_market_options {
#     market_type = "spot"
#   }  
}
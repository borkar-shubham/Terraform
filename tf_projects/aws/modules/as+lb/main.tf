//AutoScaling
resource "aws_autoscaling_group" "asg" {
  name                      = "asg_1"
  max_size                  = 3
  min_size                  = 1
  desired_capacity          = 2
  health_check_grace_period = 300
  health_check_type         = "ELB"
  force_delete              = true
  #placement_group           = aws_placement_group.test.id
  #launch_configuration      = aws_launch_configuration.foobar.name
  vpc_zone_identifier       = ["aws_subnet.tf_vpc_pub_sub_id","aws_subnet.tf_vpc_pvt_sub_id"] #["data.aws_subnets.vpc-1_subnets"]

  launch_template {
    id      = aws_launch_template.prod_lt.id
    version = "$Latest"
  }
}

//LoadBalancer TG
resource "aws_lb_target_group" "web_tg" {
  name = "web-tg"
  port = 80
  protocol = "HTTP"
  #target_type = "ip"    //used when target type is IP address
  vpc_id = var.vpc_id
}

//Attaching ASG with TG
resource "aws_autoscaling_attachment" "asg_attachment" {
  autoscaling_group_name = aws_autoscaling_group.asg.id
  lb_target_group_arn    = aws_lb_target_group.web_tg.arn
  #elb                    = aws_elb.test.id
}

//Application Load Balancer
resource "aws_lb" "prod_alb" {
  name               = "prod-alb"
  internal           = false
  load_balancer_type = "application"
  ip_address_type = "ipv4"
  security_groups    = ["aws_security_group.tf_vpc_sg_id"]
#   subnet_mapping {
#     subnet_id = ""
#   }
  subnets            = ["aws_subnet.tf_vpc_pvt_sub_id"]
  #subnets            = [for subnet in aws_subnet.public : subnet.id] //alternative to above
  enable_deletion_protection = false
  tags = {
    Environment = "prod"
  }
}
//ListenerGroup
resource "aws_lb_listener" "alb_forward_listener" {
    load_balancer_arn = aws_lb.prod_alb.arn
    port = "80"
    protocol = "HTTP"
    default_action {
        type = "forward"
        target_group_arn = aws_lb_target_group.web_tg.arn
    }
}
//AutoScaling Group
resource "aws_autoscaling_group" "my_asg" {
  name                      = var.asg_name
  max_size                  = 3
  min_size                  = 1
  desired_capacity          = 2
  health_check_grace_period = 300
  health_check_type         = "ELB"
  force_delete              = true
  #placement_group           = aws_placement_group.test.id
  #launch_configuration      = aws_launch_configuration.foobar.name
  vpc_zone_identifier = var.vpc_zone #["data.aws_subnets.tf_vpc_subnets"]  #["aws_subnets.tf_vpc_pvt_sub_id"]

  launch_template {
    id      = aws_launch_template.demo_lt.id
    version = "$Latest"
  }
}

//LoadBalancer TGs
resource "aws_lb_target_group" "my_tg" {
  name     = var.tg_name
  port     = var.tg_port
  protocol = "HTTP"
  #target_type = "ip"    //used when target type is IP address
  vpc_id = var.vpc_id
}

//Attaching ASG with TGs
resource "aws_autoscaling_attachment" "asg_attachment" {
  autoscaling_group_name = aws_autoscaling_group.my_asg.id
  lb_target_group_arn    = aws_lb_target_group.my_tg.arn
  #elb                    = aws_elb.prod_alb.id
}

//Application Load Balancer
resource "aws_lb" "my_alb" {
  name               = var.lb_name
  internal           = false
  load_balancer_type = var.lb_type
  ip_address_type    = "ipv4"
  security_groups    = var.security_groups
  #   subnet_mapping {
  #     subnet_id = ""
  #   }
  subnets = var.vpc_zone
  #subnets            = [for subnet in aws_subnet.public : subnet.id] //alternative to above
  enable_deletion_protection = false
  tags = {
    Environment = "prod"
  }
}
//ListenerGroup
resource "aws_lb_listener" "web_alb_forward_listener" {
  load_balancer_arn = aws_lb.my_alb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.my_tg.arn
  }
}
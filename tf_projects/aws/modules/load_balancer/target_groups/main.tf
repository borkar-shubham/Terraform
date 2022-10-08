//LoadBalancer TGs
resource "aws_lb_target_group" "my_tg" {
  name        = var.tg_name
  port        = var.port
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = var.vpc_id
  health_check {
    enabled             = "true"
    healthy_threshold   = "3"
    interval            = "30"
    matcher             = "200"
    protocol            = "HTTP"
    timeout             = "2"
    unhealthy_threshold = "3"
    path                = var.health_check
    port                = var.port
  }
}

resource "aws_lb_listener_rule" "rule" {
  listener_arn = var.listener_arn
  priority     = var.priority

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.my_tg.arn
  }

  condition {
    path_pattern {
      values = ["${var.path}"]
    }
  }
}
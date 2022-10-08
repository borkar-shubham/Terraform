//Application Load Balancer
resource "aws_lb" "alb" {
  count                      = var.lb_type == "application" ? 1 : 0
  name                       = format("%s-%s-alb", var.env, var.namespace)
  internal                   = false
  load_balancer_type         = "application"
  ip_address_type            = "ipv4"
  security_groups            = var.security_groups
  subnets                    = var.subnets
  enable_deletion_protection = false

  tags = merge({
    name = format("%s-%s-alb", var.env, var.namespace)
  }, var.tags)
}

//Network Load Balancer
resource "aws_lb" "nlb" {
  count                      = var.lb_type == "network" ? 1 : 0
  name                       = format("%s-%s-nlb", var.env, var.namespace)
  internal                   = false
  load_balancer_type         = "network"
  ip_address_type            = "ipv4"
  subnets                    = var.subnets
  enable_deletion_protection = false

  tags = merge({
    name = format("%s-%s-nlb", var.env, var.namespace)
  }, var.tags)
}

//lb_Listener
resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = var.lb_type == "application" ? aws_lb.alb[0].arn : aws_lb.nlb[0].arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Fixed response content"
      status_code  = "200"
    }
  }
}

module "tg" {
  source       = "./target_groups"
  for_each     = var.tg
  listener_arn = aws_lb_listener.http_listener.arn
  vpc_id       = var.vpc_id
  name         = each.key
  port         = lookup(each.value, "port", null)
  path         = lookup(each.value, "path", null)
  priority     = lookup(each.value, "priority", null)
  health_check = lookup(each.value, "health_check", null)
}
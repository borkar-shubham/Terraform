output "lb_dns" {
  count = var.lb_type == "application" ? 1 : 0
  value = aws_lb.alb.dns_name
}
output "lb_dns" {
  count = var.lb_type == "network" ? 1 : 0
  value = aws_lb.nlb.dns_name
}
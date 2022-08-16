output "lb_dns" {
    value = aws_lb.prod_alb.dns_name
}
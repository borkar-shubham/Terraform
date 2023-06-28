output "web_tier_lb_dns" {
  value = module.web_tier.lb_dns
}
output "app_tier_lb_dns" {
  value = module.app_tier.lb_dns
}

output "db_endpoint" {
  value = module.db_tier.db_instance_endpoint
}
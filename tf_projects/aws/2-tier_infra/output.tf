output "app_tier_lb_dns" {
  value = module.app_tier
}

output "db_endpoint" {
  value = module.db_tier.db_instance_endpoint
}
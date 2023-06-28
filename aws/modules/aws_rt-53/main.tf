resource "aws_route53_zone" "tf_hosted_zone" {
  name = var.domain_name
}

//Enabling the allow_overwrite argument will allow managing these records 
//in a single Terraform run without the requirement for terraform import.
# resource "aws_route53_record" "ns_soa" {
#   count   = var.record_type == "NS" ? 1 : 0
#   allow_overwrite = true
#   name            = "test.tf_hosted_zone.com"
#   ttl             = 172800
#   type            = var.record_type
#   zone_id         = aws_route53_zone.tf_hosted_zone.zone_id

#   records = [
#     aws_route53_zone.tf_hosted_zone.name_servers[0],
#     aws_route53_zone.tf_hosted_zone.name_servers[1],
#     aws_route53_zone.tf_hosted_zone.name_servers[2],
#     aws_route53_zone.tf_hosted_zone.name_servers[3],
#   ]
# }

//A record
resource "aws_route53_record" "a_record" {
  count   = var.record_type == "A" ? 1 : 0
  zone_id = aws_route53_zone.tf_hosted_zone.zone_id
  name    = var.domain_name
  type    = var.record_type
  ttl     = 300
  records = var.ip_address
}

//A records with alias to elb dns
resource "aws_route53_record" "alias_record" {
  count   = var.record_type == "A" ? 1 : 0
  zone_id = aws_route53_zone.tf_hosted_zone.zone_id
  name    = var.domain_name
  type    = var.record_type

  alias {
    name                   = var.aws_elb_dns_name
    zone_id                = var.aws_elb_zone_id
    evaluate_target_health = true
  }
}

//cname records
resource "aws_route53_record" "www-dev" {
  count   = var.record_type == "CNAME" ? 1 : 0
  zone_id = aws_route53_zone.tf_hosted_zone.zone_id
  name    = "www"
  type    = var.record_type
  ttl     = 5

  weighted_routing_policy {
    weight = 10
  }

  set_identifier = "dev"
  records        = ["dev.example.com"]
}

resource "aws_route53_record" "www-live" {
  count   = var.record_type == "CNAME" ? 1 : 0
  zone_id = aws_route53_zone.tf_hosted_zone.zone_id
  name    = "www"
  type    = var.record_type
  ttl     = 5

  weighted_routing_policy {
    weight = 90
  }

  set_identifier = "live"
  records        = ["live.example.com"]
}
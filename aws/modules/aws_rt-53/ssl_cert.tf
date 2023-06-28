resource "aws_acm_certificate" "ssl_cert" {
  domain_name       = var.domain_name
  validation_method = "DNS"
}

data "aws_route53_zone" "example" {
  name         = var.domain_name
  private_zone = false
}

resource "aws_route53_record" "ssl_record" {
  for_each = {
    for dvo in aws_acm_certificate.example.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = data.aws_route53_zone.example.zone_id
}

resource "aws_acm_certificate_validation" "example" {
  certificate_arn         = aws_acm_certificate.example.arn
  validation_record_fqdns = [for record in aws_route53_record.example : record.fqdn]
}

resource "aws_lb_listener" "example" {
  # ... other configuration ...

  certificate_arn = aws_acm_certificate_validation.example.certificate_arn
}
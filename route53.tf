resource "aws_route53_zone" "primary" {
  count = var.create_hosted_zone ? 1 : 0

  name = var.domain_name
}

resource "aws_route53_record" "www" {
  count = var.create_hosted_zone ? 1 : 0

  zone_id = aws_route53_zone.primary[0].zone_id
  name    = "brianclin.dev"
  type    = "A"
  alias {
    name                   = module.cdn.cloudfront_distribution_domain_name
    zone_id                = module.cdn.cloudfront_distribution_hosted_zone_id
    evaluate_target_health = true
  }
}

output "cloudfront_distribution_id" {
  value = module.cdn.cloudfront_distribution_id
}

output "s3_bucket_id" {
    value = aws_s3_bucket.this.id
}

output "cloudfront_distribution_domain_name" {
    value = module.cdn.cloudfront_distribution_domain_name
}

output "cloudfront_distribution_hosted_zone_id" {
    value = module.cdn.cloudfront_distribution_hosted_zone_id
}

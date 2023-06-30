output "cloudfront_distribution_id" {
  value       = module.cdn.cloudfront_distribution_id
  description = "Cloudfront distribution id"
}

output "s3_bucket_id" {
  value       = aws_s3_bucket.this.id
  description = "S3 Bucket id"
}

output "cloudfront_distribution_domain_name" {
  value       = module.cdn.cloudfront_distribution_domain_name
  description = "Cloudfront distribution domain name"
}

output "cloudfront_distribution_hosted_zone_id" {
  value       = module.cdn.cloudfront_distribution_hosted_zone_id
  description = "Cloudfront distribution hosted zoned id"
}

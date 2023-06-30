output "cloudfront_distribution_id" {
  value = module.cdn.cloudfront_distribution_id
}

output "s3_bucket_id" {
    value = aws_s3_bucket.this.id
}

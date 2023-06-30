variable "bucket_name" {
  type        = string
  description = "Name of s3 bucket"
}

variable "domain_name" {
  type        = string
  description = "Domain name"
}

variable "create_hosted_zone" {
  type        = bool
  default     = true
  description = "Whether you want to create hosted zone in AWS"
}

variable "enable_count_api" {
  type        = bool
  default     = true
  description = "Whether you have a visitor count api with the api gateway"
}

variable "api_gateway_invoke_url" {
  type        = string
  default     = ""
  description = "API Gateway invoke url used with the visitor count api"
}

variable "index_html_source" {
  type        = string
  default     = "index.html"
  description = "name of file for homepage"
}

variable "bucket_name" {
  description = "Name of s3 bucket"
  type        = string
}

variable "domain_name" {
  type = string
}

variable "create_hosted_zone" {
  type = bool
  default = true
}

variable "enable_count_api" {
  type = bool
  default = true
}

variable "api_gateway_invoke_url" {
  type = string
  default = ""
}

variable "index_html_source" {
  type = string
  default = "index.html"
}

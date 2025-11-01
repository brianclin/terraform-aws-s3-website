resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name

  tags = {
    Terraform = "true"
  }
}

resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.this.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_policy" "this" {
  bucket = aws_s3_bucket.this.id
  policy = data.aws_iam_policy_document.cloudfront.json
}

data "aws_iam_policy_document" "cloudfront" {
  statement {
    principals {
      type        = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }

    actions = [
      "s3:GetObject",
    ]

    resources = [
      aws_s3_bucket.this.arn,
      "${aws_s3_bucket.this.arn}/*",
    ]

    condition {
      test     = "StringEquals"
      variable = "AWS:SourceArn"

      values = [module.cdn.cloudfront_distribution_arn]
    }
  }
}

resource "aws_s3_object" "html" {
  bucket        = aws_s3_bucket.this.id
  key           = "index.html"
  source        = var.index_html_source
  etag          = filemd5(var.index_html_source)
  content_type  = "text/html"
  cache_control = "public, max-age=31536000"
}

resource "aws_s3_object" "svg" {
  for_each      = fileset("./assets/svg", "**")
  bucket        = aws_s3_bucket.this.id
  key           = "/assets/svg/${each.value}"
  source        = "./assets/svg/${each.value}"
  etag          = filemd5("./assets/svg/${each.value}")
  cache_control = "public, max-age=31536000"
  content_type  = "image/svg+xml"
}

resource "aws_s3_object" "other_html" {
  for_each      = fileset("./html", "**")
  bucket        = aws_s3_bucket.this.id
  key           = "/html/${each.value}"
  source        = "./html/${each.value}"
  etag          = filemd5("./html/${each.value}")
  cache_control = "public, max-age=31536000"
  content_type  = "text/html"
}

resource "aws_s3_object" "favicon" {
  count         = fileexists("favicon.ico") ? 1 : 0
  bucket        = aws_s3_bucket.this.id
  key           = "favicon.ico"
  source        = "favicon.ico"
  etag          = fileexists("favicon.ico") ? filemd5("favicon.ico") : null
  cache_control = "public, max-age=31536000"
  content_type  = "image/x-icon"
}

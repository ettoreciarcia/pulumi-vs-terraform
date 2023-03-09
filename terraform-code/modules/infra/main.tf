terraform {
  required_providers {
    aws = {
      source  = "aws"
      version = "~>4.00"
    }
  }
}

terraform {
  required_version = ">= 1.0"
}

locals {
  application_name = var.tags["Application"]
}


resource "aws_s3_bucket" "website" {
  bucket = "${local.application_name}-${var.bucket_suffix}"
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.website.id
  acl    = "public-read"
}

resource "aws_s3_bucket_website_configuration" "bucket_website" {
  bucket = aws_s3_bucket.website.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.website.id

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::${aws_s3_bucket.website.bucket}/*"
        }
    ]
}
POLICY
}


module "cdn_website" {
  source  = "terraform-aws-modules/cloudfront/aws"
  version = "2.9.3"

  aliases             = [var.domain_name]
  enabled             = true
  is_ipv6_enabled     = true
  price_class         = "PriceClass_All"
  retain_on_delete    = false
  wait_for_deployment = false
  default_root_object = "index.html"

  origin = {
    s3_origin_data = {
      domain_name = aws_s3_bucket_website_configuration.bucket_website.website_endpoint
      custom_origin_config = {
        http_port              = 80
        https_port             = 443
        origin_protocol_policy = "http-only"
        origin_ssl_protocols   = ["TLSv1"]
      }

    }
  }

  default_cache_behavior = {
    target_origin_id       = "s3_origin_data"
    viewer_protocol_policy = "redirect-to-https"
    allowed_methods        = ["GET", "HEAD", "OPTIONS", "DELETE", "PATCH", "POST", "PUT"]
    cached_methods         = ["GET", "HEAD"]
    compress               = false
    query_string           = true
    cookies_forward        = "all"
    headers                = ["Access-Control-Request-Headers", "Access-Control-Request-Method", "Authorization", "Origin"]
  }

  viewer_certificate = {
    acm_certificate_arn = var.acm_certificate_arn
    ssl_support_method  = "sni-only"
  }

}


resource "aws_route53_record" "A_record" {
  zone_id = var.route53_zone_id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = module.cdn_website.cloudfront_distribution_domain_name
    zone_id                = module.cdn_website.cloudfront_distribution_hosted_zone_id
    evaluate_target_health = false
  }

}

resource "aws_route53_record" "AAAA_record" {
  zone_id = var.route53_zone_id
  name    = var.domain_name
  type    = "AAAA"
  alias {
    name                   = module.cdn_website.cloudfront_distribution_domain_name
    zone_id                = module.cdn_website.cloudfront_distribution_hosted_zone_id
    evaluate_target_health = false
  }
}

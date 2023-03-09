variable "application_name" {
  type        = string
  description = "Name of the application"
}

variable "environment" {
  type        = string
  description = "Environment of the application dev/test/prod"
}

variable "region" {
  type = string
}

variable "acm_certificate_arn" {
  type        = string
  description = "ARN of the ACM certificate to use for the CloudFront distribution"
}

variable "domain_name" {
  type        = string
  description = "Domain name to use for the CloudFront distribution"
}

variable "route53_zone_id" {
  type        = string
  description = "Route53 zone ID"
}

variable "bucket_suffix" {
  type = string
}

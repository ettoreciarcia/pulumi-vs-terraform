variable "tags" {
  type        = map(string)
  default     = {}
  description = "List tags to pass to resources"
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

variable "tags" {
  type        = map(string)
  default     = {}
  description = "List tags to pass to resources"
}

variable "bucket_arn" {
  type = string
}

variable "cloudfront_distribution_arn" {
  type = string
}

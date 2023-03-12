output "bucket_arn" {
  value = aws_s3_bucket.website.arn
}

output "bucket_name" {
  value = aws_s3_bucket.website.id
}

output "cloudfront_distribution_arn" {
  value = module.cdn_website.cloudfront_distribution_arn
}

output "cloudfront_distribution_domain_name" {
  value = module.cdn_website.cloudfront_distribution_domain_name
}

output "cloudfront_distribution_id" {
  value = module.cdn_website.cloudfront_distribution_id
}

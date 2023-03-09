output "bucket_arn" {
  value = aws_s3_bucket.website.arn
}

output "cloudfront_distribution_arn" {
  value = module.cdn_website.cloudfront_distribution_arn

}

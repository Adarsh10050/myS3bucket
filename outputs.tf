output "website_endpoint" {
  description = "The endpoint URL of the S3 static website"
  value       = aws_s3_bucket.mys3bucket.website_endpoint
}
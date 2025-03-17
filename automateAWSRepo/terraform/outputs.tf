output "backend_lambda_function_name" {
  value = local.lambda_function_name
}

output "backend_api_gateway_url" {
  description = "Invoke URL for the backend API"
  value       = "${aws_api_gateway_deployment.deployment.invoke_url}"
}

output "frontend_s3_bucket_url" {
  description = "URL of the frontend S3 bucket"
  value       = "http://${aws_s3_bucket.frontend_bucket.bucket}.s3-website-${var.aws_region}.amazonaws.com"
}

output "frontend_cloudfront_url" {
  description = "URL of the frontend CloudFront distribution"
  value       = "https://${aws_cloudfront_distribution.frontend.domain_name}"
}

output "backend_bucket_suffix" {
  value = random_id.backend_suffix.hex
}

output "frontend_bucket_suffix" {
  value = random_id.frontend_suffix.hex
}

output "cloudfront_distribution_id" {
  value = aws_cloudfront_distribution.frontend.id
}
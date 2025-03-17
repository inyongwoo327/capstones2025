locals {
  environment                  = terraform.workspace
  s3_bucket_backend            = "${var.s3_bucket_backend}-${terraform.workspace}"
  s3_bucket_frontend           = "${var.s3_bucket_frontend}-${terraform.workspace}"
  api_gateway_name             = "${var.api_gateway_name}-${terraform.workspace}"
  lambda_function_name         = "${var.lambda_function_name}-${terraform.workspace}"
  cloudfront_distribution_name = "${var.cloudfront_distribution_name}-${terraform.workspace}"
}
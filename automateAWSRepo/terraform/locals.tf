locals {
  environment          = terraform.workspace
  s3_bucket_backend    = "lambda-deployment-${terraform.workspace}"
  s3_bucket_frontend   = "frontend-app-${terraform.workspace}"
  api_gateway_name     = "backend-api-${terraform.workspace}"
  lambda_function_name = "backend-lambda-${terraform.workspace}"
}

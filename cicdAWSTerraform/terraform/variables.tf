variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "eu-west-1"
}

variable "environment" {
  description = "Deployment environment (dev or prod)"
  type        = string
  default     = "dev"
}

variable "s3_bucket_backend" {
  description = "S3 bucket for storing Lambda deployment package"
  type        = string
  # Remove dynamic default, require input or set via locals
  default = "cicdawsterraform-backend-deployment"
}

variable "s3_bucket_frontend" {
  description = "S3 bucket for hosting frontend application"
  type        = string
  # Remove dynamic default, require input or set via locals
  default = "cicdawsterraform-frontend-deployment"
}

variable "api_gateway_name" {
  description = "API Gateway name"
  type        = string
  # Remove dynamic default, require input or set via locals
  default = "backend-api"
}

variable "lambda_function_name" {
  description = "AWS Lambda function name"
  type        = string
  # Remove dynamic default, require input or set via locals
  default = "backend-lambda"
}

variable "cloudfront_distribution_name" {
  description = "Name of the CloudFront distribution"
  type        = string
  # Remove dynamic default, require input or set via locals
  default = "frontend-cdn"
}

variable "lambda_runtime" {
  description = "Runtime for the Lambda function"
  type        = string
  default     = "nodejs20.x"
}

variable "lambda_handler" {
  description = "Lambda function handler"
  type        = string
  default     = "index.handler"
}

variable "iam_role" {
  description = "IAM Role for AWS services"
  type        = string
  # Replace with dynamically created role ARN if using Terraform to create the role
  default = "arn:aws:iam::590184075527:role/GitHubActionsRole"
}

variable "terraform_state_bucket" {
  description = "S3 bucket for storing Terraform state"
  type        = string
  default     = "terraform-state-1741561765"
}
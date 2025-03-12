variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "eu-west-1"
}

# variable "environment" {
#   description = "Deployment environment (dev or prod)"
#   type        = string
#   default     = "dev"
# }

# variable "s3_bucket_backend" {
#   description = "S3 bucket for storing Lambda deployment package"
#   type        = string
#   default     = "lambda-deployment-${terraform.workspace}"
# }

# variable "s3_bucket_frontend" {
#   description = "S3 bucket for hosting frontend application"
#   type        = string
#   default     = "frontend-app-${terraform.workspace}"
# }

# variable "codepipeline_name" {
#   description = "AWS CodePipeline name"
#   type        = string
#   default     = "full-app-pipeline-${terraform.workspace}"
# }

# variable "codecommit_repo" {
#   description = "Name of the AWS CodeCommit repository"
#   type        = string
#   default     = "app-repo-${terraform.workspace}"
# }

# variable "api_gateway_name" {
#   description = "API Gateway name"
#   type        = string
#   default     = "backend-api-${terraform.workspace}"
# }

# variable "lambda_function_name" {
#   description = "AWS Lambda function name"
#   type        = string
#   default     = "backend-lambda-${terraform.workspace}"
# }

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
  default     = "arn:aws:iam::590184075527:role/GitHubActionsRole"
}
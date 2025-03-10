resource "aws_s3_bucket" "lambda_bucket" {
  bucket = "lambda-deployment-${terraform.workspace}"

  tags = {
    Name        = "Lambda Deployment Bucket"
    Environment = terraform.workspace
  }
}
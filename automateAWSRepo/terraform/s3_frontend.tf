resource "aws_s3_bucket" "frontend_bucket" {
  bucket = "frontend-app-${terraform.workspace}"

  tags = {
    Name        = "Frontend S3 Bucket"
    Environment = terraform.workspace
  }
}
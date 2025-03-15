resource "aws_s3_bucket" "terraform_state" {
    bucket = "terraform-state-1741561765"
}

resource "aws_s3_bucket_public_access_block" "terraform_state_block" {
    bucket = "terraform-state-1741561765"
    block_public_acls       = true
    block_public_policy     = true
    ignore_public_acls      = true
    restrict_public_buckets = true
}

resource "random_id" "frontend_suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "frontend_bucket" {
  bucket = "frontend-app-${terraform.workspace}-${random_id.frontend_suffix.hex}"
}

resource "aws_s3_bucket_website_configuration" "frontend_website" {
  bucket = aws_s3_bucket.frontend_bucket.id
  index_document {
    suffix = "index.html"
  }
}

resource "random_id" "lambda_suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "lambda_bucket" {
  bucket = "lambda-deployment-${terraform.workspace}-${random_id.lambda_suffix.hex}"
}
resource "random_id" "lambda_suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "lambda_bucket" {
  bucket = "lambda-deployment-${terraform.workspace}-${random_id.lambda_suffix.hex}"
}
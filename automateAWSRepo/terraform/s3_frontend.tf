resource "random_id" "frontend_suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "frontend_bucket" {
  bucket = "frontend-app-${terraform.workspace}-${random_id.frontend_suffix.hex}"
}

terraform {
  backend "s3" {
    bucket = var.terraform_state_bucket
    region = var.aws_region
  }
}
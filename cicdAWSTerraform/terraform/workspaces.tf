terraform {
  backend "s3" {
    bucket = "cicdawsterraform-state-bucket"
    region = "eu-west-1"
  }
}
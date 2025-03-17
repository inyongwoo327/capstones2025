terraform {
  backend "s3" {
    bucket = "terraform-state-1741561765"
    key    = "env/${terraform.workspace}/terraform.tfstate"
    region = "eu-west-1"
  }
}
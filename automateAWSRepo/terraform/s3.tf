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

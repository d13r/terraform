data "aws_s3_bucket" "terraform" {
  bucket = "d13r-terraform"
}

# Keep historical versions for 90 days in case we need them
resource aws_s3_bucket_versioning "terraform" {
  bucket  = data.aws_s3_bucket.terraform.bucket

  versioning_configuration {
    status = "Enabled"
  }
}

resource aws_s3_bucket_lifecycle_configuration "terraform_delete-noncurrent-versions-after-90-days" {
  bucket = data.aws_s3_bucket.terraform.bucket

  rule {
    id     = "delete-noncurrent-versions-after-90-days"
    status = "Enabled"

    noncurrent_version_expiration {
      noncurrent_days = 90
    }
  }
}

# Make sure the files can't be made public, since they contain sensitive data
resource "aws_s3_bucket_public_access_block" "terraform_state" {
  bucket                  = data.aws_s3_bucket.terraform.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

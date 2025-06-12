provider "aws" {
  region = "us-west-2"
  access_key=AKIAURLTMUOKZUPIDCGD
  secret_key=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
}

resource "aws_s3_bucket" "dev_s3" {
  bucket_prefix = "dev-"

  tags = {
    Environment      = "Dev"
  }
}

resource "aws_s3_bucket_ownership_controls" "dev_s3" {
  bucket = aws_s3_bucket.dev_s3.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

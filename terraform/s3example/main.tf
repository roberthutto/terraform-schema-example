provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "bucket" {
  bucket = var.s3_bucket.name

  tags = var.required_tags
}
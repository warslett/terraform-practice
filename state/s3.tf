resource "aws_s3_bucket" "state-bucket" {
  bucket = var.state-bucket-name
}

resource "aws_s3_bucket_versioning" "state-bucket-versioning" {
  bucket = aws_s3_bucket.state-bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

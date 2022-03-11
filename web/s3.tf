resource "aws_s3_bucket" "web-bucket" {
  bucket = "william-arslett-terraform-web-bucket-1"
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.web-bucket.id
  acl    = "public-read"
}

resource "aws_s3_object" "index" {
  bucket = aws_s3_bucket.web-bucket.id
  key    = "index.html"
  source = "static/index.html"
  content_type = "text/html"
}

resource "aws_s3_bucket_website_configuration" "website-configuration" {
  bucket = aws_s3_bucket.web-bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_bucket_policy" "site" {
  bucket = aws_s3_bucket.web-bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource = [
          aws_s3_bucket.web-bucket.arn,
          "${aws_s3_bucket.web-bucket.arn}/*",
        ]
      },
    ]
  })
}

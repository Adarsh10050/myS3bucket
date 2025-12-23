# ----------------- S3 Bucket -----------------
resource "aws_s3_bucket" "mys3bucket" {
  bucket = var.bucketname
  acl    = "public-read"  # you can optionally set this here
}

# ----------------- Ownership Controls -----------------
resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.mys3bucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

# ----------------- Public Access Block -----------------
resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.mys3bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# ----------------- ACL -----------------
resource "aws_s3_bucket_acl" "example" {
  depends_on = [
    aws_s3_bucket_ownership_controls.example,
    aws_s3_bucket_public_access_block.example
  ]

  bucket = aws_s3_bucket.mys3bucket.id
  acl    = "public-read"
}

# ----------------- Index HTML -----------------
resource "aws_s3_object" "index" {
  bucket        = aws_s3_bucket.mys3bucket.id
  key           = "index.html"
  source        = "index.html"
  acl           = "public-read"
  content_type  = "text/html"

  # Force Terraform to update if the file changes
  etag = filemd5("index.html")
}

# ----------------- Error HTML -----------------
resource "aws_s3_object" "error_page" {
  bucket        = aws_s3_bucket.mys3bucket.id
  key           = "error.html"
  source        = "error.html"
  acl           = "public-read"
  content_type  = "text/html"

  # Force Terraform to update if the file changes
  etag = filemd5("error.html")
}

# ----------------- Website Configuration -----------------
resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.mys3bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

  depends_on = [aws_s3_bucket_acl.example]
}


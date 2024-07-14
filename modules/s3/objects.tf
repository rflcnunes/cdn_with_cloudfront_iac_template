resource "aws_s3_object" "cdn_example_object" {
  bucket = aws_s3_bucket.bucket.id
  key    = "index.min.js"
  source = "artifacts/cdn/dist/index.min.js"
  acl    = "private"

  content_type = "application/javascript"
}

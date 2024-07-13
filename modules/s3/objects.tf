resource "aws_s3_object" "cdn_example_object" {
  bucket = aws_s3_bucket.finger_security_bucket.bucket
  key    = "index.min.js"
  source = "artifacts/cdn/dist/index.min.js"
  acl    = "public-read"

  content_type = "application/javascript"
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = var.bucket_name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          AWS = aws_cloudfront_origin_access_identity.oai.iam_arn
        }

        Action   = "s3:GetObject"
        Resource = "${var.bucket_arn}/*"
      },
    ]
  })

  depends_on = [aws_cloudfront_origin_access_identity.oai]
}
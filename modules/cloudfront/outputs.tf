output "cdn_domain_name" {
  value = aws_cloudfront_distribution.cdn_distribution.domain_name
}

output "cloudfront_oai_arn" {
  value = aws_cloudfront_origin_access_identity.oai.iam_arn
}
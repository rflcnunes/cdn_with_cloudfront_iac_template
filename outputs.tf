output "bucket_information" {
  description = "The information about the bucket"
  value = {
    id          = module.s3.bucket_id
    arn         = module.s3.bucket_arn
    domain_name = module.s3.bucket_domain_name
  }
}

output "cdn_information" {
  value = {
    cdn_domain_name = module.cloudfront.cdn_domain_name
  }
}
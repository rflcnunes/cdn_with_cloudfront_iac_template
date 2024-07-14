variable "bucket_name" {
  type        = string
  description = "Name of the S3 bucket"
}

variable "environment" {
  type        = string
  description = "Environment where the resources will be created"
}

variable "cloudfront_oai_arn" {
  type        = string
  description = "The ARN of the CloudFront Origin Access Identity"
}
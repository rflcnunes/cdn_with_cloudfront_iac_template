variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "bucket_arn" {
  description = "The ARN of the S3 bucket"
  type        = string
}

variable "environment" {
  description = "The environment for the resources"
  type        = string
}
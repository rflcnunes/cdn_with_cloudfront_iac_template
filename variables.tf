# Provider variables 
variable "aws_region" {
  type        = string
  description = "Region where the resources will be created"
  default     = "us-east-1"
}

variable "aws_profile" {
  type        = string
  description = "AWS profile to use"
}

variable "environment" {
  type        = string
  description = "Environment where the resources will be created"
}

# S3 module variables
variable "bucket_name" {
  type        = string
  description = "Name of the S3 bucket"
}

# API Gateway module variables
variable "api_name" {
  type        = string
  description = "Name of the API Gateway"
}
variable "environment" {
  type        = string
  description = "Environment where the resources will be created"
}

variable "lambda_role_name" {
  type        = string
  description = "Name of the IAM role for Lambda"
}
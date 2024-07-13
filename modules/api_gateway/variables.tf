variable "api_name" {
  description = "The name of the API Gateway"
  type        = string
}

variable "lambda_function_name" {
  description = "The name of the Lambda function"
  type        = string
}

variable "lambda_arn" {
  description = "The ARN of the Lambda function"
  type        = string
}

variable "environment" {
  description = "The environment (e.g. `dev`, `staging`, `prod`)"
  type        = string
}
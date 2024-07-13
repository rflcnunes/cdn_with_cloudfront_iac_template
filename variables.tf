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

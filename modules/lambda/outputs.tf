output "lambda_arn" {
  value = aws_lambda_function.ip_finder.arn
}

output "lambda_invoke_arn" {
  value = aws_lambda_function.ip_finder.invoke_arn
}

output "lambda_function_name" {
  value = aws_lambda_function.ip_finder.function_name
}

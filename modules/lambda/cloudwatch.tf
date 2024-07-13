resource "aws_cloudwatch_log_group" "ip_finder_log_group" {
  name = "/aws/lambda/${aws_lambda_function.ip_finder.function_name}"
}
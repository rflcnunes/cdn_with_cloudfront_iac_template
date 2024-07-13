resource "aws_lambda_function" "ip_finder" {
  function_name    = "ip_finder"
  role             = var.role_arn
  handler          = "main"
  runtime          = "provided.al2023"
  filename         = "artifacts/ip_finder.zip"
  source_code_hash = filebase64sha256("artifacts/ip_finder.zip")

  environment {
    variables = {
      LOG_GROUP_NAME = aws_cloudwatch_log_group.ip_finder_log_group.name
    }
  }

  depends_on = [
    aws_cloudwatch_log_group.ip_finder_log_group,
  ]
}

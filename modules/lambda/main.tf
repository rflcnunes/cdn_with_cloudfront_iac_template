resource "aws_lambda_function" "ip_finder" {
  function_name    = "ip_finder"
  role             = var.role_arn
  handler          = "main"
  runtime          = "provided.al2023"
  filename         = "artifacts/lambdas/ip_finder.zip"
  source_code_hash = filebase64sha256("artifacts/lambdas/ip_finder.zip")
}

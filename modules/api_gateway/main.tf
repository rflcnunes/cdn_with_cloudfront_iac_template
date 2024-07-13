resource "aws_api_gateway_rest_api" "example_cdn_api" {
  name        = var.api_name
  description = "API Gateway for the example CDN"
}

resource "aws_lambda_permission" "apigw_lambda" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = var.lambda_function_name
  principal     = "apigateway.amazonaws.com"

  source_arn = "${aws_api_gateway_rest_api.example_cdn_api.execution_arn}/*/*"
}

resource "aws_api_gateway_deployment" "example_cdn_api" {
  rest_api_id = aws_api_gateway_rest_api.example_cdn_api.id

  depends_on = [
    aws_api_gateway_integration.ip_verifier_get_lambda
  ]
}

resource "aws_api_gateway_stage" "example_cdn_api" {
  rest_api_id   = aws_api_gateway_rest_api.example_cdn_api.id
  deployment_id = aws_api_gateway_deployment.example_cdn_api.id
  stage_name    = var.environment

  access_log_settings {
    destination_arn = aws_cloudwatch_log_group.api_gateway_logs.arn

    format = jsonencode({
      requestId    = "$context.requestId",
      ip           = "$context.identity.sourceIp",
      request      = "$context.requestTime",
      response     = "$context.responseTime",
      status       = "$context.status",
      method       = "$context.httpMethod",
      resource     = "$context.resourcePath",
      responseBody = "$context.integration.response.body"
    })
  }
}

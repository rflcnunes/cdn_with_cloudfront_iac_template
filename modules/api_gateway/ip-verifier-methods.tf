resource "aws_api_gateway_resource" "ip_verifier" {
  rest_api_id = aws_api_gateway_rest_api.example_cdn_api.id
  parent_id   = aws_api_gateway_rest_api.example_cdn_api.root_resource_id
  path_part   = "ip-verifier"

  depends_on = [
    aws_api_gateway_rest_api.example_cdn_api,
  ]
}

resource "aws_api_gateway_method" "ip_verifier_get" {
  rest_api_id   = aws_api_gateway_rest_api.example_cdn_api.id
  resource_id   = aws_api_gateway_resource.ip_verifier.id
  http_method   = "GET"
  authorization = "NONE"

  depends_on = [
    aws_api_gateway_resource.ip_verifier,
  ]
}

resource "aws_api_gateway_integration" "ip_verifier_get_lambda" {
  rest_api_id             = aws_api_gateway_rest_api.example_cdn_api.id
  resource_id             = aws_api_gateway_resource.ip_verifier.id
  http_method             = aws_api_gateway_method.ip_verifier_get.http_method
  type                    = "AWS_PROXY"
  integration_http_method = "POST"
  uri                     = var.lambda_invoke_arn

  depends_on = [
    aws_api_gateway_method.ip_verifier_get,
  ]
}

resource "aws_api_gateway_method_response" "ip_verifier_get_200" {
  rest_api_id = aws_api_gateway_rest_api.example_cdn_api.id
  resource_id = aws_api_gateway_resource.ip_verifier.id
  http_method = aws_api_gateway_method.ip_verifier_get.http_method
  status_code = "200"

  response_parameters = {
    "method.response.header.Access-Control-Allow-Origin" = true
  }

  depends_on = [
    aws_api_gateway_integration.ip_verifier_get_lambda,
  ]
}

resource "aws_api_gateway_method_settings" "ip_verifier_get" {
  rest_api_id = aws_api_gateway_rest_api.example_cdn_api.id
  stage_name  = aws_api_gateway_stage.example_cdn_api.stage_name
  method_path = "*/*"

  settings {
    logging_level      = "INFO"
    metrics_enabled    = true
    data_trace_enabled = true
  }

  depends_on = [
    aws_api_gateway_stage.example_cdn_api,
  ]
}

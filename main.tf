module "s3" {
  source = "./modules/s3"

  bucket_name = var.bucket_name
  environment = var.environment
}

module "iam" {
  source = "./modules/iam"

  lambda_role_name = "example-cdn"
  environment      = var.environment
}

module "lambda" {
  source = "./modules/lambda"

  role_arn = module.iam.lambda_role_arn

  depends_on = [
    module.iam,
  ]
}

module "api_gateway" {
  source               = "./modules/api_gateway"

  api_name             = var.api_name
  lambda_function_name = module.lambda.lambda_function_name
  lambda_arn           = module.lambda.lambda_arn
  lambda_invoke_arn    = module.lambda.lambda_invoke_arn
  environment          = var.environment

  depends_on = [
    module.lambda,
  ]
}

module "cloudfront" {
  source = "./modules/cloudfront"

  bucket_name = module.s3.bucket_name
  bucket_arn  = module.s3.bucket_arn
  environment = var.environment

  depends_on = [
    module.api_gateway,
    module.s3,
  ]
}
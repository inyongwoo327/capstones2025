resource "aws_lambda_function" "backend_lambda" {
  function_name = local.lambda_function_name
  role          = var.iam_role
  handler       = var.lambda_handler
  runtime       = var.lambda_runtime

  s3_bucket = aws_s3_bucket.lambda_bucket.id
  s3_key    = "backend.zip"

  environment {
    variables = {
      ENVIRONMENT = local.environment
    }
  }
}
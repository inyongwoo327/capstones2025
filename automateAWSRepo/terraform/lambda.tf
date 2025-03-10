resource "aws_lambda_function" "backend_lambda" {
  function_name = "backend-lambda-${terraform.workspace}"
  role          = "arn:aws:iam::590184075527:role/role_for_codepipeline"
  handler       = "index.handler"
  runtime       = "nodejs20.x"

  s3_bucket = aws_s3_bucket.lambda_bucket.bucket
  s3_key    = "backend.zip"

  environment {
    variables = {
      ENV = terraform.workspace
    }
  }
}
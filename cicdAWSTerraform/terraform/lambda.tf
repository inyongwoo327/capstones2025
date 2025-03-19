resource "aws_iam_role" "lambda_exec" {
  name = "${local.lambda_function_name}-exec-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_policy" {
  role       = aws_iam_role.lambda_exec.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_role_policy" "lambda_s3_policy" {
  name = "${local.lambda_function_name}-s3-policy"
  role = aws_iam_role.lambda_exec.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:PutObject"
        ]
        Resource = "${aws_s3_bucket.backend_bucket.arn}/*"
      }
    ]
  })
}

resource "aws_lambda_function" "backend_lambda" {
  function_name = local.lambda_function_name
  role          = aws_iam_role.lambda_exec.arn
  handler       = var.lambda_handler
  runtime       = var.lambda_runtime

  s3_bucket = aws_s3_bucket.backend_bucket.id
  s3_key    = "backend.zip"
  # Remove source_code_hash since the file is not present locally during terraform plan
  # source_code_hash = filebase64sha256("../backend/backend.zip")

  environment {
    variables = {
      ENVIRONMENT = local.environment
    }
  }
}
resource "aws_api_gateway_rest_api" "backend_api" {
  name        = local.api_gateway_name
  description = "API Gateway for backend lambda"
}

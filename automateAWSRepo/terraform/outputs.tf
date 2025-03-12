output "backend_lambda_function_name" {
  value = local.lambda_function_name
}

# output "backend_api_gateway_url" {
#   description = "Invoke URL for the backend API"
#   value       = aws_api_gateway_stage.api_stage.invoke_url
# }
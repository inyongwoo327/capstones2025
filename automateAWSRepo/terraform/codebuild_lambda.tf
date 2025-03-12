# resource "aws_codebuild_project" "lambda_codebuild" {
#   name          = "lambda-deployment-${terraform.workspace}"
#   service_role  = aws_iam_role.pipeline_role.arn

#   artifacts {
#     type = "NO_ARTIFACTS"
#   }

#   environment {
#     compute_type                = "BUILD_GENERAL1_SMALL"
#     image                       = "aws/codebuild/standard:5.0"
#     type                        = "LINUX_CONTAINER"
#     privileged_mode             = false
#   }

#   source {
#     type            = "CODEPIPELINE"
#     buildspec       = "buildspec_lambda.yml"
#   }
# }
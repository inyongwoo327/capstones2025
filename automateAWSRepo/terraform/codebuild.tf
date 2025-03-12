resource "aws_codebuild_project" "backend_codebuild" {
  name         = local.codebuild_name
  service_role = var.iam_role

  artifacts {
    type = "NO_ARTIFACTS"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/standard:5.0"
    type                        = "LINUX_CONTAINER"
    privileged_mode             = false
  }

  source {
    type            = "CODECOMMIT"
    location        = aws_codecommit_repository.app_repo.clone_url_http
    buildspec       = "backend/buildspec.yml"
  }
}
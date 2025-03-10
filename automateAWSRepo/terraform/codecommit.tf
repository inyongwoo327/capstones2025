resource "aws_codecommit_repository" "app_repo" {
  repository_name = "app-repo-${terraform.workspace}"
}
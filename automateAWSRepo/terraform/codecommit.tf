resource "aws_codecommit_repository" "app_repo" {
  repository_name = local.codecommit_repo
}
resource "aws_codepipeline" "app_pipeline" {
  name     = "full-app-pipeline-${terraform.workspace}"
  role_arn = "arn:aws:iam::590184075527:role/role_for_codepipeline"

  artifact_store {
    location = aws_s3_bucket.terraform_state.bucket
    type     = "S3"
  }

  # Source Stage
  stage {
    name = "Source"
    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeCommit"
      version          = "1"
      output_artifacts = ["SourceOutput"]
      configuration = {
        RepositoryName = aws_codecommit_repository.app_repo.repository_name
        BranchName     = "main"
      }
    }
  }

  # Build & Test Backend Stage
  stage {
    name = "TestBackend"
    action {
      name             = "RunBackendTests"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      version          = "1"
      input_artifacts  = ["SourceOutput"]
      output_artifacts = ["TestOutput"]
      configuration = {
        ProjectName = aws_codebuild_project.backend_codebuild.name
      }
    }
  }

  # Deploy Backend to AWS Lambda
  stage {
    name = "DeployBackend"
    action {
      name            = "DeployLambda"
      category        = "Deploy"
      owner           = "AWS"
      provider        = "Lambda"
      version         = "1"
      input_artifacts = ["TestOutput"]
      configuration = {
        FunctionName = aws_lambda_function.backend_lambda.function_name
      }
    }
  }

  # Deploy Frontend to S3
  stage {
    name = "DeployFrontend"
    action {
      name            = "DeployToS3"
      category        = "Deploy"
      owner           = "AWS"
      provider        = "S3"
      version         = "1"
      input_artifacts = ["SourceOutput"]
      configuration = {
        BucketName = aws_s3_bucket.frontend_bucket.bucket
        Extract    = "true"
      }
    }
  }
}
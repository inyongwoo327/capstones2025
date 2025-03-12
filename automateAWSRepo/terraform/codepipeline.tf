resource "aws_codepipeline" "app_pipeline" {
  name     = local.codepipeline_name
  role_arn = var.iam_role

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
        RepositoryName = local.codecommit_repo
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
        ProjectName = local.codebuild_name
      }
    }
  }

  # Deploy Backend to AWS Lambda
  # stage {
  #   name = "DeployBackend"
  #   action {
  #     name            = "DeployLambda"
  #     category        = "Deploy"
  #     owner           = "AWS"
  #     provider        = "Lambda"
  #     version         = "1"
  #     input_artifacts = ["TestOutput"]
  #     configuration = {
  #       FunctionName = local.lambda_function_name
  #     }
  #   }
  # }
  stage {
    name = "DeployBackend"
    action {
      name     = "DeployLambda"
      category = "Build"
      provider = "CodeBuild"
      owner    = "AWS"
      version  = "1"
      input_artifacts = ["TestOutput"]
      configuration = {
        ProjectName = aws_codebuild_project.lambda_codebuild.name
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
# Implementation Plan

(1) Basic setup
- Install terraform, aws cli
- Configure aws access and secret keys locally
- Install node and vue for backend and frontend

(2) Grant new AWS account (user) for mentor
- IAM User (or Role)
- Attach policies
- Send temporary credentials to mentor

(3) Application creation
- Backend: node.js
- Frontend: TypeScript and Vue.js (node v20.18.3)
- Test app locally before deciding to use

(4) Architecture and repo structures
- Architecture diagram combining terraform, aws code repo, CI/CD, cloud resources, etc.   
- Terraform & repository structure
- Decide repositories names such as:
    - frontend
    - backend
- Prepare code updates in GitHub
- Decide which cloud infra resources to include
- Do we really need CloudFormation?
    - Terraform can deploy AWS resources, and terraform workspace can divide DEV and PROD.
    - CloudFormation may not be necessary?
- Clarify where to save buildspec (frontend and backend repos) files for CodeBuild
- No Dockerfiles

(5) CodeCommit setup
- Clarify the AWS CodeCommit repositories structures and names 
- Setup AWS CodeCommit using IAM Git credentials (AWS access and secret keys)

(6) CodeBuild setup
- Clarify script language and tool for testing and linting
- Buildspec yaml files for:
    - frontend
    - backend
- Test cases (if have time)
    - Python
    - Pylint

(7) CodePipeline setup (CodeDeploy)
- backend
    - Elastic Beanstalk & EC2
- frontend
    - s3 and CloudFront (for hosting)
- No ECS, Dockerfiles, Docker images (More costs and complicated implementations)


# How to run project with Terraform commands
(1) 
Navigate to the terraform directory

cd terraform

(2) 
Initialize terraform

terraform init

(3) 
Preview changes

terraform plan

(4) 
Apply changes (Deploy aws infrastructure)

terraform apply
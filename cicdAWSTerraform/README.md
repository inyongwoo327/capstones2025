# Implementation Plan

(1) Basic setup
- Install terraform, aws cli
- Configure aws access and secret keys locally
- Install node and vue for backend and frontend

(2) Grant new AWS IAM User account to the mentor
- IAM User and Role (Permissions)
- Attach policies
- Send temporary credentials to the mentor

(3) Application creation
- Backend: node.js
- Frontend: TypeScript and Vue.js (node v20.18.3)
- Test app locally before deciding to use
- Test cases

(4) Architecture and repo structures
- Architecture diagram combining terraform, aws code repo, CI/CD, cloud resources, etc.   
- Terraform & repository structure
- Prepare code updates in GitHub
- Decide repositories names such as:
    - frontend_a_dev
    - backend_a_dev
    - frontend_a_prod
    - backend_a_prod
- Do we really need CloudFormation?
    - Terraform can deploy AWS resources, and terraform workspace can divide DEV and PROD.
    - CloudFormation may not be necessary?
- Decide which aws resources to include
- Clarify where to save workflow files.
- How many workflow files do we need?
- No Dockerfiles

(5) GitHub Actions setup
- Clarify the repositories structures and names 
- Setup AWS credentials and role with GitHub actions access (AWS access and secret keys)
- Test case ran by buildspec
  - backend: Python
  - frontend: jest
  - linting (ESLint)
- yaml files for:
    - frontend (node server.js)
    - backend (npm run serve)
    - terraform apply

(7) deployment setup
- backend
    - No need ElasticBeanstalk and EC2
    - Lambda and S3
- frontend
    - S3 and CloudFront (for hosting)
- No ECS, Dockerfiles, Docker images (More costs and complicated implementations)


# How to run project with Terraform commands
(1) 
Navigate to the terraform directory

cd terraform

(2) 
If workspace has not created, and it needs terraform init, then initialize terraform first

terraform init -reconfigure -backend-config="key=env/dev/terraform.tfstate"

Then create workspaces for dev and prod

Then run:
terraform init -reconfigure -backend-config="key=env/prod/terraform.tfstate"

(3) 
Preview changes at each workspace

terraform plan

(4) 
Apply changes (Deploy aws infrastructure)

terraform apply
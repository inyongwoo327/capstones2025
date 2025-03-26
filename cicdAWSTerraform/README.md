# Implementation Plan

(1) Basic setup
- Install terraform, aws cli
- Configure aws access and secret keys locally
- Install node and vue for backend and frontend

(2) Set up Admin IAM user and grant new AWS IAM User account to the mentor
- Assign role (Permissions) to Admin and an IAM User account (Mentor)
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
- Do we really need CloudFormation?
    - Terraform can deploy AWS resources, and terraform workspace can divide DEV and PROD.
    - CloudFormation is not necessary
- Decide which aws resources to include
- Clarify where to save workflow files.
- How many workflow files do we need?
- No Dockerfiles

(5) GitHub Actions setup
- Clarify the repositories structures and names 
- Setup AWS credentials and role with GitHub actions access (AWS access and secret keys)
- Application files with test case
  - backend: Python
  - frontend: jest
  - linting (ESLint)
- YAML files for:
    - frontend (node server.js)
    - backend (npm run serve)
    - terraform apply

(6) deployment setup
- backend
    - No need ElasticBeanstalk and EC2
    - Lambda, API Gateway and S3
- frontend
    - S3 and CloudFront (for hosting)
- No ECS, Dockerfiles, Docker images (More costs and complicated implementations)



# How to run project and deploy with Terraform commands

(1) Navigate to the terraform-state directory

    - cd capstones2025/cicdAWSTerraform/terraform-state

(2) Create the s3 bucket for terraform remote state.

    - terraform init

    - terraform apply --auto-approve

(3) Navigate to the terraform directory 

    - cd capstones2025/cicdAWSTerraform/terraform

(4) It needs to conduct terraform init to initialize terraform for dev environment

    - terraform init -backend-config="key=env/dev/terraform.tfstate" -reconfigure

(5) Create and move to the dev workspace (environment)

    - terraform workspace new dev

(6) Conduct terraform plan 

    - terraform plan

(7) Conduct terraform apply to create the AWS resources in dev environment

    - terraform apply --auto-approve

(8) After completing deployments for dev environment, it needs to conduct terraform init to initialize terraform for prod environment

    - terraform init -backend-config="key=env/prod/terraform.tfstate" -reconfigure

(9) Create and move to the prod workspace (environment)

    - terraform workspace new prod

(10) Conduct terraform plan 

    - terraform plan

(11) Conduct terraform apply to create the AWS resources in prod environment

    - terraform apply --auto-approve
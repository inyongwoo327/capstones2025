# Capstone: Automating CI/CD pipeline and AWS Infra setup with Terraform and GitHub Actions


## Project overview
The goal of this capstone project is to create an automated solution using Terraform and GitHub Actions to set up new software project repositories with AWS account. The final solution should enforce a standardized structure across all projects and ensure that each repository is provisioned with essential development and deployment configurations (CI/CD). 


## Automated Deployments
The GitHub Actions workflow of this project (Jobs) automate to create AWS resources with terraform scripts and the code repositories. They conduct deployments both in dev and prod environments using terraform workspace
    - Automate to deploy s3 bucket for terraform remote state
    - Automate to create AWS resources in dev environments
    - Automate to create AWS resources in prod environments


## Project Directory Structure

- capstones2025
    - .github
        - workflow
            - workflow file
    - cicdAWSTerraform
        - terraform-state
            - terraform file for remote state s3 bucket
        - terraform
            - terraform files for aws resources
        - backend
            - application source file 
            - test file
        - frontend
            - src
                - application source file
                - test file
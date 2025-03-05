# Implementation Plan

(1) Basic setup
- Install terraform, aws cli
- Configure aws access and secret keys locally
- Install node and vue for backend and frontend

(2) Application creation
- Backend: node.js
- Frontend: TypeScript and Vue.js.
- Test app locally before deciding to use

(3) Architecture and repo structures
- Architecture diagram combining terraform, aws code repo, CI/CD, cloud resources, etc.   
- Terraform & repository structure
- Decide repositories names
    - frontend
    - backend
- Decide which cloud infra resources to include
- Compare resource differences in DEV and PROD

(4) CodeCommit setup
- Clarify the AWS CodeCommit repositories structures and names 
- Setup AWS CodeCommit using IAM Git credentials (AWS access and secret keys)
- Clarify script language for testing and linting



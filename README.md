# container-hosting-with-ecs
A simple containerised application using Python Flask as the backend and redis as the DB. The goal is to achieve deployment automation to AWS Fargate service. This includes two parts:

1. Use terraform to describe and provision the architecture in AWS.
2. Use GitHub Action to continuously build and push images to ECR.
## Deploy to local Environments
Have your local docker running and free port 8000, go to project root dir
```bash
# Spin up local dev environment
docker compose up -d
```
To shutdown, also go to project root dir
```bash
docker compose down
```
## Deploy to AWS with Terraform
todo...

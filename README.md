# container-hosting-with-ecs
Provision aws fargate service and host simple application on it.
## Deploy to local Environments
Have your local docker running and free port 8000, go to project root dir
```bash
# Setup local environment
export APP_ENV=dev
# Spin up containers with docker compose
docker compose up -d
```
To shutdown, also go to project root dir
```bash
docker compose down
```
## Deploy to AWS with Terraform
todo...

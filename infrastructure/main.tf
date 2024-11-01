terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

variable "thumbprint" {
  type = string
}

variable "audience" {
  type = string
}

variable "repo_name" {
  type = string
}

provider "aws" {
  region = "ap-southeast-2"
}

module "oidc" {
  source = "./modules/iam"
  repo_name = var.repo_name
  provider_thumbprint = var.thumbprint
  audience = var.audience
  provider_url = "https://token.actions.githubusercontent.com"
}
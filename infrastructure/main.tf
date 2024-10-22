terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-southeast-2"
}

module "oidc" {
  source = "./modules/oidc"
  provider_url = "https://token.actions.githubusercontent.com"
}
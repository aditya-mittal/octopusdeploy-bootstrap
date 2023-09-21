terraform {
  required_version = "1.2.6"

  backend "s3" {
    bucket         = "my-aws-terraform-state-bucket"
    key            = "my-space"
    region         = "eu-central-1"
    encrypt        = true
    dynamodb_table = "my-aws-terraform-lock-table"
  }

  required_providers {
    octopusdeploy = {
      source  = "OctopusDeployLabs/octopusdeploy"
      version = "0.7.73"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "4.24.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.12.1"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
}
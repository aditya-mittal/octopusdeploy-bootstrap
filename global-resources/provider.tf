terraform {
  required_version = "1.2.6"

  backend "s3" {
    bucket         = "my-aws-terraform-state-bucket"
    key            = "global-resources/roles"
    region         = "eu-central-1"
    encrypt        = true
    dynamodb_table = "my-aws-terraform-lock-table"
  }
  required_providers {
    octopusdeploy = {
      source  = "OctopusDeployLabs/octopusdeploy"
      version = "0.7.73"
    }
  }
}

provider "octopusdeploy" {
  address = local.octopus_endpoint
  api_key = var.octopus_api_key
  alias   = "global-resources"
}
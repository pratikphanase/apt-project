terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "apt-project-tf-state-590183931718"
    key            = "terraform.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "apt-project-tf-lock"
    encrypt        = true
  }
}

provider "aws" {
  region = var.region
}

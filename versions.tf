# Terraform version
terraform {
  required_version = ">= 1.13.3"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 6.14.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.7.2"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "3.1.0"
    }
  }
}
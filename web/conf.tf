provider "aws" {
  region  = var.region
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }

  backend "s3" {
    bucket         = "william-arslett-terraform-state-bucket-1"
    key            = "terraform.tfstate"
    dynamodb_table = "terraform-state-lock"
  }
}

terraform {
  required_providers {
    aws = {
    source = "hashicorp/aws"
    version = "~>3.0"
    //region  = var.aws_region
    }
  }
}

provider "aws" {
  region  = var.aws_region
}
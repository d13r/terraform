terraform {
  required_version = "~> 1.3"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  access_key          = var.aws_iam_access_key
  secret_key          = var.aws_iam_secret_key
  region              = "eu-west-1"
  allowed_account_ids = ["956547487034"] # d13r
}

terraform {
  required_providers {

    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }

    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.0"
    }

    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "~> 1.0"
    }

  }
}

provider "aws" {
  region     = "eu-west-1" # Ireland
  access_key = var.aws_iam_access_key
  secret_key = var.aws_iam_secret_key
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

provider "hcloud" {
  token = var.hcloud_token
}

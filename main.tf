terraform {
  required_version = "~> 1.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.16"
    }

    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    profile = "d13r"
    region  = "eu-west-1"
    bucket  = "d13r-terraform"
    key     = "d13r.tfstate"
  }
}

provider "aws" {
  profile             = "d13r"
  allowed_account_ids = ["956547487034"]
  region              = "eu-west-1"

  default_tags {
    tags = {
      ManagedBy = "github.com/d13r/terraform"
    }
  }
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

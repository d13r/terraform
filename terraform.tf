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

    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "1.43.0"
    }
  }

  backend "s3" {
    profile = "d13r"
    region  = "eu-west-1"
    bucket  = "d13r-terraform"
    key     = "d13r.tfstate"
  }
}

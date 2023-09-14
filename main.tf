provider "aws" {
  profile             = "d13r"
  allowed_account_ids = ["956547487034"]
  region              = "eu-west-1"

  default_tags {
    tags = {
      ManagedBy = local.managed_by
    }
  }
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

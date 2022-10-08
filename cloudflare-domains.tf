resource "cloudflare_zone" "djm_me" {
  # Primary domain
  account_id = cloudflare_account.djm.id
  zone       = "djm.me"
}

resource "cloudflare_zone" "davejamesmiller_com" {
  # Legacy domain
  account_id = cloudflare_account.djm.id
  zone       = "davejamesmiller.com"
}

resource "cloudflare_zone" "d13r_uk" {
  # Test domain
  account_id = cloudflare_account.djm.id
  zone       = "d13r.uk"
}

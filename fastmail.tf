module "fastmail_domain-djm_me" {
  source          = "./modules/fastmail_domain"
  cloudflare_zone = data.cloudflare_zone.djm_me
  managed_comment = local.managed_comment
}

module "fastmail_domain-davejamesmiller_com" {
  source          = "./modules/fastmail_domain"
  cloudflare_zone = data.cloudflare_zone.davejamesmiller_com
  managed_comment = local.managed_comment
}

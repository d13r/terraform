module "djm_me" {
  source          = "./modules/fastmail-dns"
  cloudflare_zone = cloudflare_zone.djm_me
}

module "davejamesmiller_com" {
  source          = "./modules/fastmail-dns"
  cloudflare_zone = cloudflare_zone.davejamesmiller_com
}

resource "cloudflare_record" "kara_djm_me_A" {
  zone_id = cloudflare_zone.djm_me.id
  name    = "kara"
  type    = "A"
  value   = "192.168.5.3"
}

resource "cloudflare_record" "kara_djm_me_TXT_spf" {
  zone_id = cloudflare_zone.djm_me.id
  name    = "kara"
  type    = "TXT"
  value   = "v=spf1 include:spf.messagingengine.com a:home.djm.me -all"
}

resource "cloudflare_record" "STAR_kara_djm_me_CNAME" {
  zone_id = cloudflare_zone.djm_me.id
  name    = "*.kara"
  type    = "CNAME"
  value   = "kara.djm.me"
}

resource "cloudflare_record" "glados_djm_me_A" {
  zone_id = cloudflare_zone.djm_me.id
  name    = "glados.djm.me"
  type    = "A"
  value   = "192.168.5.2"
}

resource "cloudflare_record" "glados_djm_me_SPF" {
  zone_id = cloudflare_zone.djm_me.id
  name    = "glados.djm.me"
  type    = "TXT"
  value   = "v=spf1 include:spf.messagingengine.com a:home.djm.me -all"
}

resource "cloudflare_record" "STAR_glados_djm_me_CNAME" {
  zone_id = cloudflare_zone.djm_me.id
  name    = "*.glados.djm.me"
  type    = "CNAME"
  value   = "glados.djm.me"
}

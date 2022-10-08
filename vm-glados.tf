resource "cloudflare_record" "glados_djm_me_A" {
  zone_id = cloudflare_zone.djm_me.id
  name    = "glados"
  type    = "A"
  value   = "192.168.5.2"
}

resource "cloudflare_record" "glados_djm_me_TXT_spf" {
  zone_id = cloudflare_zone.djm_me.id
  name    = "glados"
  type    = "TXT"
  value   = "v=spf1 include:spf.messagingengine.com a:home.djm.me -all"
}

resource "cloudflare_record" "STAR_glados_djm_me_CNAME" {
  zone_id = cloudflare_zone.djm_me.id
  name    = "*.glados"
  type    = "CNAME"
  value   = "glados.djm.me"
}

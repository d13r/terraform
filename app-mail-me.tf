resource "cloudflare_record" "mail_djm_me_CNAME" {
  zone_id = cloudflare_zone.djm_me.id
  name    = "mail.djm.me"
  type    = "CNAME"
  value   = "summer.djm.me"
}

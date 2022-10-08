resource "cloudflare_record" "red_djm_me_CNAME" {
  zone_id = cloudflare_zone.djm_me.id
  name    = "red"
  type    = "CNAME"
  value   = "summer.djm.me"
}

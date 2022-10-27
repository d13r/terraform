resource "cloudflare_record" "gallery_djm_me_CNAME" {
  zone_id = cloudflare_zone.djm_me.id
  name    = "gallery"
  type    = "CNAME"
  value   = "summer.djm.me"
}

# Collector
resource "cloudflare_record" "c_djm_me" {
  zone_id = data.cloudflare_zone.djm_me.zone_id
  name    = "c"
  type    = "CNAME"
  value   = "holly.djm.me"
  comment = local.managed_comment
}

# Photos
resource "cloudflare_record" "photos_djm_me" {
  zone_id = data.cloudflare_zone.djm_me.zone_id
  name    = "photos"
  type    = "CNAME"
  value   = "holly.djm.me"
  comment = local.managed_comment
}

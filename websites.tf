# Collector
resource "cloudflare_record" "c_djm_me" {
  zone_id = data.cloudflare_zone.djm_me.zone_id
  name    = "c"
  type    = "CNAME"
  value   = "red.djm.me"
  comment = local.managed_comment
}

# Notes
resource "cloudflare_record" "notes_djm_me" {
  zone_id = data.cloudflare_zone.djm_me.zone_id
  name    = "notes"
  type    = "CNAME"
  value   = "red.djm.me"
  comment = local.managed_comment
}

# Photos
resource "cloudflare_record" "photos_djm_me" {
  zone_id = data.cloudflare_zone.djm_me.zone_id
  name    = "photos"
  type    = "CNAME"
  value   = "red.djm.me"
  comment = local.managed_comment
}

# Temp
resource "cloudflare_record" "temp_djm_me" {
  zone_id = data.cloudflare_zone.djm_me.zone_id
  name    = "temp"
  type    = "CNAME"
  value   = "red.djm.me"
  comment = local.managed_comment
}

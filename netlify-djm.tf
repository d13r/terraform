resource "cloudflare_record" "djm_me" {
  zone_id = data.cloudflare_zone.djm_me.zone_id
  name    = "@"
  type    = "CNAME" # Flattened
  value   = "djm.netlify.app"
  comment = local.managed_comment
}

resource "cloudflare_record" "www_djm_me" {
  zone_id = data.cloudflare_zone.djm_me.zone_id
  name    = "www"
  type    = "CNAME"
  value   = "djm.netlify.app"
  comment = local.managed_comment
}

resource "cloudflare_record" "davejamesmiller_com" {
  zone_id = data.cloudflare_zone.davejamesmiller_com.zone_id
  name    = "@"
  type    = "CNAME" # Flattened
  value   = "djm.netlify.app"
  comment = local.managed_comment
}

resource "cloudflare_record" "www_davejamesmiller_com" {
  zone_id = data.cloudflare_zone.davejamesmiller_com.zone_id
  name    = "www"
  type    = "CNAME"
  value   = "djm.netlify.app"
  comment = local.managed_comment
}

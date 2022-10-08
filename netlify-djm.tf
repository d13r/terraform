resource "cloudflare_record" "djm_me_CNAME" {
  zone_id = cloudflare_zone.djm_me.id
  name    = "@"
  type    = "CNAME"
  value   = "djm.netlify.app"
}

resource "cloudflare_record" "www_djm_me_CNAME" {
  zone_id = cloudflare_zone.djm_me.id
  name    = "www"
  type    = "CNAME"
  value   = "djm.netlify.app"
}

resource "cloudflare_record" "davejamesmiller_com_CNAME" {
  zone_id = cloudflare_zone.davejamesmiller_com.id
  name    = "@"
  type    = "CNAME"
  value   = "djm.netlify.app"
}

resource "cloudflare_record" "www_davejamesmiller_com_CNAME" {
  zone_id = cloudflare_zone.davejamesmiller_com.id
  name    = "www"
  type    = "CNAME"
  value   = "djm.netlify.app"
}

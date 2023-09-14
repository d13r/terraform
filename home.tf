# Router
resource "cloudflare_record" "home_djm_me" {
  zone_id = data.cloudflare_zone.djm_me.zone_id
  name    = "home"
  type    = "A"
  value   = "84.92.51.193"
  comment = "Managed by github.com/d13r/terraform"
}

# Raspberry Pi
resource "cloudflare_record" "pi_djm_me" {
  zone_id = data.cloudflare_zone.djm_me.zone_id
  name    = "pi"
  type    = "A"
  value   = "192.168.1.91"
  comment = "Managed by github.com/d13r/terraform"
}

resource "cloudflare_record" "STAR_pi_djm_me" {
  zone_id = data.cloudflare_zone.djm_me.zone_id
  name    = "*.pi"
  type    = "CNAME"
  value   = "pi.djm.me"
  comment = "Managed by github.com/d13r/terraform"
}

# Old desktop
resource "cloudflare_record" "maria_djm_me" {
  zone_id = data.cloudflare_zone.djm_me.zone_id
  name    = "maria"
  type    = "A"
  value   = "192.168.1.154"
  comment = "Managed by github.com/d13r/terraform"
}

resource "cloudflare_record" "STAR_maria_djm_me" {
  zone_id = data.cloudflare_zone.djm_me.zone_id
  name    = "*.maria"
  type    = "CNAME"
  value   = "maria.djm.me"
  comment = "Managed by github.com/d13r/terraform"
}

# NAS
resource "cloudflare_record" "daydreamer-nas_djm_me" {
  zone_id = data.cloudflare_zone.djm_me.zone_id
  name    = "daydreamer-nas"
  type    = "A"
  value   = "192.168.1.144"
  comment = "Managed by github.com/d13r/terraform"
}

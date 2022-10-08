# Static IP
resource "cloudflare_record" "home_djm_me_A" {
  zone_id = cloudflare_zone.djm_me.id
  name    = "home.djm.me"
  type    = "A"
  value   = "84.92.51.193"
}

# Chell - Laptop
resource "cloudflare_record" "chell_djm_me_A" {
  zone_id = cloudflare_zone.djm_me.id
  name    = "chell.djm.me"
  type    = "A"
  value   = "127.0.0.1"
}

resource "cloudflare_record" "STAR_chell_djm_me_CNAME" {
  zone_id = cloudflare_zone.djm_me.id
  name    = "*.chell.djm.me"
  type    = "CNAME"
  value   = "chell.djm.me"
}

# Milton - Desktop PC
resource "cloudflare_record" "milton_djm_me_A" {
  zone_id = cloudflare_zone.djm_me.id
  name    = "milton.djm.me"
  type    = "A"
  value   = "192.168.0.123"
}

# Raspberry Pi
resource "cloudflare_record" "pi_djm_me_A" {
  zone_id = cloudflare_zone.djm_me.id
  name    = "pi.djm.me"
  type    = "A"
  value   = "192.168.0.100"
}

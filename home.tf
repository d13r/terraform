# home.djm.me (public IP) managed by DynDNS client

# 10.0.0.x for static physical devices
# 10.0.1.x for static virtual machines
# 10.0.2.x for DHCP devices

# Router
resource "cloudflare_record" "router_djm_me" {
  zone_id = data.cloudflare_zone.djm_me.zone_id
  name    = "router"
  type    = "A"
  value   = "10.0.0.1"
  comment = local.managed_comment
}

# Pi-hole, PiVPN
resource "cloudflare_record" "pi_djm_me" {
  zone_id = data.cloudflare_zone.djm_me.zone_id
  name    = "pi"
  type    = "A"
  value   = "10.0.0.2"
  comment = local.managed_comment
}

# Proxmox server
resource "cloudflare_record" "proxmox_djm_me" {
  zone_id = data.cloudflare_zone.djm_me.zone_id
  name    = "proxmox"
  type    = "A"
  value   = "10.0.0.3"
  comment = local.managed_comment
}

# NAS
resource "cloudflare_record" "nas_djm_me" {
  zone_id = data.cloudflare_zone.djm_me.zone_id
  name    = "nas"
  type    = "A"
  value   = "10.0.0.4"
  comment = local.managed_comment
}

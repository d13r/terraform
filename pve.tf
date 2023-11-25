# Proxmox server
resource "cloudflare_record" "pve_djm_me" {
  zone_id = data.cloudflare_zone.djm_me.zone_id
  name    = "pve"
  type    = "A"
  value   = "10.0.0.3"
  comment = local.managed_comment
}

# VMs
resource "cloudflare_record" "ct2310_djm_me" {
  zone_id = data.cloudflare_zone.djm_me.zone_id
  name    = "ct2310"
  type    = "A"
  value   = "10.0.1.100"
  comment = local.managed_comment
}

resource "cloudflare_record" "vm2310_djm_me" {
  zone_id = data.cloudflare_zone.djm_me.zone_id
  name    = "vm2310"
  type    = "A"
  value   = "10.0.1.101"
  comment = local.managed_comment
}

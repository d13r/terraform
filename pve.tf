# Proxmox server
resource "cloudflare_record" "pve_djm_me" {
  zone_id = data.cloudflare_zone.djm_me.zone_id
  name    = "pve"
  type    = "A"
  value   = "10.0.0.3"
  comment = local.managed_comment
}

# VMs (10.0.1.<CTID>)
#resource "cloudflare_record" "TODO_djm_me" {
#  zone_id = data.cloudflare_zone.djm_me.zone_id
#  name    = "TODO"
#  type    = "A"
#  value   = "10.0.1.100"
#  comment = local.managed_comment
#}

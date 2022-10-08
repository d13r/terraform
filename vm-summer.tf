resource "hcloud_server" "summer" {
  name        = "summer.djm.me"
  server_type = "cpx11" # 2 vCPU (shared), 2 GB, 40 GB
  location    = "nbg1" # Nuremberg, Germany
  image       = "ubuntu-20.04"

  backups            = true
  delete_protection  = true
  rebuild_protection = true

  firewall_ids = [hcloud_firewall.standard_linux.id]
  ssh_keys     = [hcloud_ssh_key.dave.id]

  public_net {
    ipv4_enabled = true
    ipv6_enabled = true
  }

  network {
    network_id = hcloud_network.djm_private.id
    ip         = "10.3.56.2"
  }

  lifecycle {
    ignore_changes = [ssh_keys]
  }
}

resource "cloudflare_record" "summer_djm_me_A" {
  zone_id = cloudflare_zone.djm_me.id
  name    = "summer.djm.me"
  type    = "A"
  value   = hcloud_server.summer.ipv4_address
}

resource "cloudflare_record" "summer_djm_me_AAAA" {
  zone_id = cloudflare_zone.djm_me.id
  name    = "summer.djm.me"
  type    = "AAAA"
  value   = hcloud_server.summer.ipv6_address
}

resource "cloudflare_record" "summer_djm_me_SPF" {
  zone_id = cloudflare_zone.djm_me.id
  name    = "summer.djm.me"
  type    = "TXT"
  value   = "v=spf1 a -all"
}

resource "cloudflare_record" "summer_private_djm_me_A" {
  for_each = {for network in hcloud_server.summer.network : network.network_id => network.ip}

  zone_id = cloudflare_zone.djm_me.id
  name    = "summer.private.djm.me"
  type    = "A"
  value   = each.value
}

resource "cloudflare_record" "STAR_summer_djm_me_CNAME" {
  zone_id = cloudflare_zone.djm_me.id
  name    = "*.summer.djm.me"
  type    = "CNAME"
  value   = "summer.djm.me"
}

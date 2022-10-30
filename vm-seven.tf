resource "hcloud_server" "seven" {
  name        = "seven.djm.me"
  server_type = "cpx11" # 2 vCPU (shared), 2 GB, 40 GB
  location    = "nbg1" # Nuremberg, Germany
  image       = "ubuntu-22.04"

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
    ip         = "10.3.56.3"
  }

  lifecycle {
    ignore_changes = [ssh_keys]
  }
}

resource "cloudflare_record" "seven_djm_me_A" {
  zone_id = cloudflare_zone.djm_me.id
  name    = "seven"
  type    = "A"
  value   = hcloud_server.seven.ipv4_address
}

resource "cloudflare_record" "seven_djm_me_AAAA" {
  zone_id = cloudflare_zone.djm_me.id
  name    = "seven"
  type    = "AAAA"
  value   = hcloud_server.seven.ipv6_address
}

resource "cloudflare_record" "seven_djm_me_TXT_spf" {
  zone_id = cloudflare_zone.djm_me.id
  name    = "seven"
  type    = "TXT"
  value   = "v=spf1 a -all"
}

resource "cloudflare_record" "seven_private_djm_me_A" {
  for_each = {for network in hcloud_server.seven.network : network.network_id => network.ip}

  zone_id = cloudflare_zone.djm_me.id
  name    = "seven.private"
  type    = "A"
  value   = each.value
}

resource "cloudflare_record" "STAR_seven_djm_me_CNAME" {
  zone_id = cloudflare_zone.djm_me.id
  name    = "*.seven"
  type    = "CNAME"
  value   = "seven.djm.me"
}

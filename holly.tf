resource "hcloud_firewall" "holly" {
  name = "holly.djm.me"

  rule {
    description = "Ping"
    direction   = "in"
    protocol    = "icmp"
    source_ips  = local.public_ips
  }

  rule {
    description = "SSH"
    direction   = "in"
    protocol    = "tcp"
    port        = "22"
    source_ips  = local.public_ips
  }

  rule {
    description = "HTTP"
    direction   = "in"
    protocol    = "tcp"
    port        = "80"
    source_ips  = local.public_ips
  }

  rule {
    description = "HTTPS"
    direction   = "in"
    protocol    = "tcp"
    port        = "443"
    source_ips  = local.public_ips
  }
}

resource "hcloud_server" "holly" {
  backups      = true
  firewall_ids = [hcloud_firewall.holly.id]
  image        = "ubuntu-22.04"
  location     = "fsn1" # Falkenstein, Germany
  name         = "holly.djm.me"
  server_type  = "cpx11" # AMD, 2vCPU, 2GB RAM, 40 GB SSD
  ssh_keys     = [hcloud_ssh_key.dave.id]

  lifecycle {
    ignore_changes = [ssh_keys]
  }
}

resource "cloudflare_record" "holly_djm_me-A" {
  zone_id = data.cloudflare_zone.djm_me.zone_id
  name    = "holly"
  type    = "A"
  value   = hcloud_server.holly.ipv4_address
  comment = local.managed_comment
}

resource "cloudflare_record" "holly_djm_me-AAAA" {
  zone_id = data.cloudflare_zone.djm_me.zone_id
  name    = "holly"
  type    = "AAAA"
  value   = hcloud_server.holly.ipv6_address
  comment = local.managed_comment
}

resource "cloudflare_record" "STAR_holly_djm_me" {
  zone_id = data.cloudflare_zone.djm_me.zone_id
  name    = "*.holly"
  type    = "CNAME"
  value   = "holly.djm.me"
  comment = local.managed_comment
}

locals {
  # I created the server first, which
  holly_datacenter = "fsn1-dc14" # Falkenstein, Germany
}

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

resource "hcloud_primary_ip" "holly_ipv4" {
  name          = "holly.djm.me-ipv4"
  datacenter    = local.holly_datacenter
  type          = "ipv4"
  assignee_type = "server"
  auto_delete   = false
}

resource "hcloud_primary_ip" "holly_ipv6" {
  name          = "holly.djm.me-ipv6"
  datacenter    = local.holly_datacenter
  type          = "ipv6"
  assignee_type = "server"
  auto_delete   = false
}

resource "hcloud_rdns" "holly_ipv4" {
  primary_ip_id = hcloud_primary_ip.holly_ipv4.id
  ip_address    = hcloud_primary_ip.holly_ipv4.ip_address
  dns_ptr       = "holly.djm.me"
}

resource "hcloud_rdns" "holly_ipv6" {
  primary_ip_id = hcloud_primary_ip.holly_ipv6.id
  ip_address    = hcloud_primary_ip.holly_ipv6.ip_address
  dns_ptr       = "holly.djm.me"
}

resource "hcloud_server" "holly" {
  backups      = true
  firewall_ids = [hcloud_firewall.holly.id]
  image        = "ubuntu-22.04"
  datacenter   = local.holly_datacenter
  name         = "holly.djm.me"
  server_type  = "cpx11" # AMD, 2vCPU, 2GB RAM, 40 GB SSD
  ssh_keys     = [hcloud_ssh_key.dave.id]

  lifecycle {
    ignore_changes = [image, ssh_keys]
  }

  public_net {
    ipv4 = hcloud_primary_ip.holly_ipv4.id
    ipv6 = hcloud_primary_ip.holly_ipv6.id
  }
}

resource "cloudflare_record" "holly_djm_me-A" {
  zone_id = data.cloudflare_zone.djm_me.zone_id
  name    = "holly"
  type    = "A"
  value   = hcloud_primary_ip.holly_ipv4.ip_address
  comment = local.managed_comment
}

resource "cloudflare_record" "holly_djm_me-AAAA" {
  zone_id = data.cloudflare_zone.djm_me.zone_id
  name    = "holly"
  type    = "AAAA"
  value   = hcloud_primary_ip.holly_ipv6.ip_address
  comment = local.managed_comment
}

resource "cloudflare_record" "STAR_holly_djm_me" {
  zone_id = data.cloudflare_zone.djm_me.zone_id
  name    = "*.holly"
  type    = "CNAME"
  value   = "holly.djm.me"
  comment = local.managed_comment
}

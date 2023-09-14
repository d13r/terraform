terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
  }
}

resource "cloudflare_record" "mx" {
  for_each = {
    10 : "in1-smtp.messagingengine.com",
    20 : "in2-smtp.messagingengine.com",
  }

  zone_id  = var.cloudflare_zone.zone_id
  name     = "@"
  type     = "MX"
  priority = each.key
  value    = each.value
  comment  = var.managed_comment
}

resource "cloudflare_record" "domainkey" {
  for_each = toset(["fm1", "fm2", "fm3", "mesmtp"])

  zone_id = var.cloudflare_zone.zone_id
  name    = "${each.value}._domainkey"
  type    = "CNAME"
  value   = "${each.value}.${var.cloudflare_zone.name}.dkim.fmhosted.com"
  comment = var.managed_comment
}

resource "cloudflare_record" "caldavs_tcp_SRV" {
  zone_id = var.cloudflare_zone.zone_id
  name    = "_caldavs._tcp"
  type    = "SRV"
  comment = var.managed_comment

  data {
    name     = var.cloudflare_zone.name
    service  = "_caldavs"
    proto    = "_tcp"
    priority = 0
    weight   = 1
    port     = 443
    target   = "caldav.fastmail.com"
  }
}

resource "cloudflare_record" "carddavs_tcp_SRV" {
  zone_id = var.cloudflare_zone.zone_id
  name    = "_carddavs._tcp"
  type    = "SRV"
  comment = var.managed_comment

  data {
    name     = var.cloudflare_zone.name
    service  = "_carddavs"
    proto    = "_tcp"
    priority = 0
    weight   = 1
    port     = 443
    target   = "carddav.fastmail.com"
  }
}

resource "cloudflare_record" "imaps_tcp_SRV" {
  zone_id = var.cloudflare_zone.zone_id
  name    = "_imaps._tcp"
  type    = "SRV"
  comment = var.managed_comment

  data {
    name     = var.cloudflare_zone.name
    service  = "_imaps"
    proto    = "_tcp"
    priority = 0
    weight   = 1
    port     = 993
    target   = "imap.fastmail.com"
  }
}

resource "cloudflare_record" "jmap_tcp_SRV" {
  zone_id = var.cloudflare_zone.zone_id
  name    = "_jmap._tcp"
  type    = "SRV"
  comment = var.managed_comment

  data {
    name     = var.cloudflare_zone.name
    service  = "_jmap"
    proto    = "_tcp"
    priority = 0
    weight   = 1
    port     = 443
    target   = "api.fastmail.com"
  }
}

resource "cloudflare_record" "pop3s_tcp_SRV" {
  zone_id = var.cloudflare_zone.zone_id
  name    = "_pop3s._tcp"
  type    = "SRV"
  comment = var.managed_comment

  data {
    name     = var.cloudflare_zone.name
    service  = "_pop3s"
    proto    = "_tcp"
    priority = 10 # Not sure why this isn't 0 like the others
    weight   = 1
    port     = 995
    target   = "pop.fastmail.com"
  }
}

resource "cloudflare_record" "submission_tcp_SRV" {
  zone_id = var.cloudflare_zone.zone_id
  name    = "_submission._tcp"
  type    = "SRV"
  comment = var.managed_comment

  data {
    name     = var.cloudflare_zone.name
    service  = "_submission"
    proto    = "_tcp"
    priority = 0
    weight   = 1
    port     = 587
    target   = "smtp.fastmail.com"
  }
}

resource "cloudflare_record" "unsecured_tcp_SRV" {
  for_each = toset(["caldav", "carddav", "imap", "pop3"])

  zone_id = var.cloudflare_zone.zone_id
  name    = "_${each.value}._tcp"
  type    = "SRV"
  comment = var.managed_comment

  data {
    name     = var.cloudflare_zone.name
    service  = "_${each.value}"
    proto    = "_tcp"
    priority = 0
    weight   = 0
    port     = 0
    target   = "."
  }
}

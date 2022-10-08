# https://www.fastmail.help/hc/en-us/articles/360060591153-Manual-DNS-configuration
# SPF records are not included here because they are not specific to Fastmail

# Standard Mail
resource "cloudflare_record" "mx_10" {
  zone_id  = var.cloudflare_zone.id
  name     = var.cloudflare_zone.zone
  type     = "MX"
  priority = 10
  value    = "in1-smtp.messagingengine.com"
}

resource "cloudflare_record" "mx_20" {
  zone_id  = var.cloudflare_zone.id
  name     = var.cloudflare_zone.zone
  type     = "MX"
  priority = 20
  value    = "in2-smtp.messagingengine.com"
}

# DKIM
resource "cloudflare_record" "domainkeys" {
  for_each = toset([
    "fm1",
    "fm2",
    "fm3",
    "mesmtp", # Deprecated, but I already had it so not sure if I should remove it
  ])

  zone_id = var.cloudflare_zone.id
  name    = "${each.value}._domainkey.${var.cloudflare_zone.zone}"
  type    = "CNAME"
  value   = "${each.value}.${var.cloudflare_zone.zone}.dkim.fmhosted.com"
}

# Client email auto-discovery
resource "cloudflare_record" "srv_submission_tcp" {
  zone_id = var.cloudflare_zone.id
  name    = var.cloudflare_zone.zone
  type    = "SRV"

  data {
    service  = "_submission"
    proto    = "_tcp"
    name     = var.cloudflare_zone.zone
    priority = 0
    weight   = 1
    port     = 587
    target   = "smtp.fastmail.com"
  }
}

resource "cloudflare_record" "srv_imap_tcp" {
  zone_id = var.cloudflare_zone.id
  name    = var.cloudflare_zone.zone
  type    = "SRV"

  data {
    service  = "_imap"
    proto    = "_tcp"
    name     = var.cloudflare_zone.zone
    priority = 0
    weight   = 0
    port     = 0
    target   = "."
  }
}

resource "cloudflare_record" "srv_imaps_tcp" {
  zone_id = var.cloudflare_zone.id
  name    = var.cloudflare_zone.zone
  type    = "SRV"

  data {
    service  = "_imaps"
    proto    = "_tcp"
    name     = var.cloudflare_zone.zone
    priority = 0
    weight   = 1
    port     = 993
    target   = "imap.fastmail.com"
  }
}

resource "cloudflare_record" "srv_pop3_tcp" {
  zone_id = var.cloudflare_zone.id
  name    = var.cloudflare_zone.zone
  type    = "SRV"

  data {
    service  = "_pop3"
    proto    = "_tcp"
    name     = var.cloudflare_zone.zone
    priority = 0
    weight   = 0
    port     = 0
    target   = "."
  }
}

resource "cloudflare_record" "srv_pop3s_tcp" {
  zone_id = var.cloudflare_zone.id
  name    = var.cloudflare_zone.zone
  type    = "SRV"

  data {
    service  = "_pop3s"
    proto    = "_tcp"
    name     = var.cloudflare_zone.zone
    priority = 10
    weight   = 1
    port     = 995
    target   = "pop.fastmail.com"
  }
}

resource "cloudflare_record" "srv_jmap_tcp" {
  zone_id = var.cloudflare_zone.id
  name    = var.cloudflare_zone.zone
  type    = "SRV"

  data {
    service  = "_jmap"
    proto    = "_tcp"
    name     = var.cloudflare_zone.zone
    priority = 0
    weight   = 1
    port     = 443
    target   = "api.fastmail.com"
  }
}

# Client CardDAV auto-discovery
resource "cloudflare_record" "srv_carddav_tcp" {
  zone_id = var.cloudflare_zone.id
  name    = var.cloudflare_zone.zone
  type    = "SRV"

  data {
    service  = "_carddav"
    proto    = "_tcp"
    name     = var.cloudflare_zone.zone
    priority = 0
    weight   = 0
    port     = 0
    target   = "."
  }
}

resource "cloudflare_record" "srv_carddavs_tcp" {
  zone_id = var.cloudflare_zone.id
  name    = var.cloudflare_zone.zone
  type    = "SRV"

  data {
    service  = "_carddavs"
    proto    = "_tcp"
    name     = var.cloudflare_zone.zone
    priority = 0
    weight   = 1
    port     = 443
    target   = "carddav.fastmail.com"
  }
}

# Client CalDAV auto-discovery
resource "cloudflare_record" "srv_caldav_tcp" {
  zone_id = var.cloudflare_zone.id
  name    = var.cloudflare_zone.zone
  type    = "SRV"

  data {
    service  = "_caldav"
    proto    = "_tcp"
    name     = var.cloudflare_zone.zone
    priority = 0
    weight   = 0
    port     = 0
    target   = "."
  }
}

resource "cloudflare_record" "srv_caldavs_tcp" {
  zone_id = var.cloudflare_zone.id
  name    = var.cloudflare_zone.zone
  type    = "SRV"

  data {
    service  = "_caldavs"
    proto    = "_tcp"
    name     = var.cloudflare_zone.zone
    priority = 0
    weight   = 1
    port     = 443
    target   = "caldav.fastmail.com"
  }
}

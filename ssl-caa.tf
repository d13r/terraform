resource "cloudflare_record" "djm_me-CAA-issue" {
  zone_id = data.cloudflare_zone.djm_me.zone_id
  name    = "@"
  type    = "CAA"
  comment = local.managed_comment

  data {
    flags = "0"
    tag   = "issue"
    value = "letsencrypt.org"
  }
}

resource "cloudflare_record" "djm_me-CAA-iodef" {
  zone_id = data.cloudflare_zone.djm_me.zone_id
  name    = "@"
  type    = "CAA"
  comment = local.managed_comment

  data {
    flags = "0"
    tag   = "iodef"
    value = "mailto:d@djm.me"
  }
}

resource "cloudflare_record" "davejamesmiller_com-CAA-issue" {
  zone_id = data.cloudflare_zone.davejamesmiller_com.zone_id
  name    = "@"
  type    = "CAA"
  comment = local.managed_comment

  data {
    flags = "0"
    tag   = "issue"
    value = "letsencrypt.org"
  }
}

resource "cloudflare_record" "davejamesmiller_com-CAA-iodef" {
  zone_id = data.cloudflare_zone.davejamesmiller_com.zone_id
  name    = "@"
  type    = "CAA"
  comment = local.managed_comment

  data {
    flags = "0"
    tag   = "iodef"
    value = "mailto:d@djm.me"
  }
}

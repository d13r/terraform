resource "cloudflare_record" "djm_me_CAA_iodef" {
  zone_id = cloudflare_zone.djm_me.id
  name    = "@"
  type    = "CAA"

  data {
    flags = 0
    tag   = "iodef"
    value = "mailto:d@djm.me"
  }
}

resource "cloudflare_record" "djm_me_CAA_letsencrypt" {
  zone_id = cloudflare_zone.djm_me.id
  name    = "@"
  type    = "CAA"

  data {
    flags = 0
    tag   = "issue"
    value = "letsencrypt.org"
  }
}

resource "cloudflare_record" "davejamesmiller_com_CAA_iodef" {
  zone_id = cloudflare_zone.davejamesmiller_com.id
  name    = "@"
  type    = "CAA"

  data {
    flags = 0
    tag   = "iodef"
    value = "mailto:d@djm.me"
  }
}

resource "cloudflare_record" "davejamesmiller_com_CAA_letsencrypt" {
  zone_id = cloudflare_zone.davejamesmiller_com.id
  name    = "@"
  type    = "CAA"

  data {
    flags = 0
    tag   = "issue"
    value = "letsencrypt.org"
  }
}

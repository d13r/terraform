resource "cloudflare_record" "dmarc_djm_me" {
  zone_id = data.cloudflare_zone.djm_me.zone_id
  name    = "_dmarc"
  type    = "TXT"
  value   = "v=DMARC1; p=reject; sp=reject; adkim=r; aspf=r; pct=100; rua=mailto:re+mc8p5fxsgcw@dmarc.postmarkapp.com;"
  comment = "Managed by github.com/d13r/terraform"
}

resource "cloudflare_record" "djm_me-SPF" {
  zone_id = data.cloudflare_zone.djm_me.zone_id
  name    = "@"
  type    = "TXT"
  value   = "v=spf1 ${module.fastmail_domain-djm_me.spf_string} include:amazonses.com -all"
  comment = "Managed by github.com/d13r/terraform"
}

resource "cloudflare_record" "dmarc_davejamesmiller_com" {
  zone_id = data.cloudflare_zone.davejamesmiller_com.zone_id
  name    = "_dmarc"
  type    = "TXT"
  value   = "v=DMARC1; p=reject; sp=reject; adkim=r; aspf=r; pct=100; rua=mailto:re+jlelgwbdzgu@dmarc.postmarkapp.com;"
  comment = "Managed by github.com/d13r/terraform"
}

resource "cloudflare_record" "davejamesmiller_com-SPF" {
  zone_id = data.cloudflare_zone.davejamesmiller_com.zone_id
  name    = "@"
  type    = "TXT"
  value   = "v=spf1 ${module.fastmail_domain-davejamesmiller_com.spf_string} include:_spf.google.com -all"
  comment = "Managed by github.com/d13r/terraform"
}

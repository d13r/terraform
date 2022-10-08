resource "cloudflare_record" "djm_me_TXT_spf" {
  zone_id = cloudflare_zone.djm_me.id
  name    = "@"
  type    = "TXT"
  # Fastmail
  value   = "v=spf1 include:spf.messagingengine.com -all"
}

resource "cloudflare_record" "davejamesmiller_com_TXT_spf" {
  zone_id = cloudflare_zone.davejamesmiller_com.id
  name    = "@"
  type    = "TXT"
  # Fastmail, Google Workspace (legacy)
  value   = "v=spf1 include:spf.messagingengine.com include:_spf.google.com -all"
}

resource "cloudflare_record" "dmarc_djm_me_TXT" {
  zone_id = cloudflare_zone.djm_me.id
  name    = "_dmarc"
  type    = "TXT"
  value   = "v=DMARC1; p=reject; sp=reject; adkim=r; aspf=r; pct=100; rua=mailto:re+mc8p5fxsgcw@dmarc.postmarkapp.com;"
}

resource "cloudflare_record" "dmarc_davejamesmiller_com_TXT" {
  zone_id = cloudflare_zone.davejamesmiller_com.id
  name    = "_dmarc"
  type    = "TXT"
  value   = "v=DMARC1; p=reject; sp=reject; adkim=r; aspf=r; pct=100; rua=mailto:re+jlelgwbdzgu@dmarc.postmarkapp.com;"
}

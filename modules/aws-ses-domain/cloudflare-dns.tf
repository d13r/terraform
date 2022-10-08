# Publish the DKIM public keys
resource "cloudflare_record" "dkim" {
  count   = 3
  zone_id = var.cloudflare_zone.id
  name    = "${element(aws_ses_domain_dkim.domain.dkim_tokens, count.index)}._domainkey"
  type    = "CNAME"
  value   = "${element(aws_ses_domain_dkim.domain.dkim_tokens, count.index)}.dkim.amazonses.com"
}

# Configure the return path subdomain
resource "cloudflare_record" "mail_from_mx" {
  zone_id  = var.cloudflare_zone.id
  name     = aws_ses_domain_mail_from.default.mail_from_domain
  type     = "MX"
  priority = 10
  value    = "feedback-smtp.${data.aws_region.current.name}.amazonses.com"
}

resource "cloudflare_record" "mail_from_txt" {
  zone_id = var.cloudflare_zone.id
  name    = aws_ses_domain_mail_from.default.mail_from_domain
  type    = "TXT"
  value   = "v=spf1 include:amazonses.com -all"
}

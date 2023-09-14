terraform {
  required_version = "~> 1.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.16"
    }

    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
  }
}

# Fetch the region ID
data "aws_region" "current" {}

# Create the domain identity in SES
resource "aws_ses_domain_identity" "djm_me" {
  domain = var.cloudflare_zone.name
}

# Create DKIM keys
resource "aws_ses_domain_dkim" "djm_me" {
  domain = var.cloudflare_zone.name
}

# Set up a subdomain for the return path (MAIL FROM address)
# https://docs.aws.amazon.com/ses/latest/dg/mail-from.html
resource "aws_ses_domain_mail_from" "ses" {
  domain           = aws_ses_domain_identity.djm_me.domain
  mail_from_domain = "ses.${var.cloudflare_zone.name}"
}

# Publish the DKIM public keys
resource "cloudflare_record" "domainkey" {
  zone_id = var.cloudflare_zone.zone_id
  count   = 3
  name    = "${element(aws_ses_domain_dkim.djm_me.dkim_tokens, count.index)}._domainkey"
  type    = "CNAME"
  value   = "${element(aws_ses_domain_dkim.djm_me.dkim_tokens, count.index)}.dkim.amazonses.com"
  comment = var.managed_comment
}

# Configure the return path subdomain
resource "cloudflare_record" "mail_from_mx" {
  zone_id  = var.cloudflare_zone.zone_id
  name     = aws_ses_domain_mail_from.ses.mail_from_domain
  type     = "MX"
  priority = 10
  value    = "feedback-smtp.${data.aws_region.current.name}.amazonses.com"
  comment  = var.managed_comment
}

resource "cloudflare_record" "mail_from_txt" {
  zone_id = var.cloudflare_zone.zone_id
  name    = aws_ses_domain_mail_from.ses.mail_from_domain
  type    = "TXT"
  value   = "v=spf1 include:amazonses.com -all"
  comment = var.managed_comment
}

# Wait for verification to complete
resource "aws_ses_domain_identity_verification" "domain_verification" {
  domain     = var.cloudflare_zone.name
  depends_on = [cloudflare_record.domainkey]
}

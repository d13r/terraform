# Create the domain identity in SES
resource "aws_ses_domain_identity" "domain" {
  domain = var.cloudflare_zone.zone
}

# Create DKIM keys
resource "aws_ses_domain_dkim" "domain" {
  domain = var.cloudflare_zone.zone
}

# Set up a subdomain for the return path (MAIL FROM address)
# https://docs.aws.amazon.com/ses/latest/dg/mail-from.html
resource "aws_ses_domain_mail_from" "default" {
  domain           = aws_ses_domain_identity.domain.domain
  mail_from_domain = "ses.${var.cloudflare_zone.zone}"
}

# Wait for verification to complete
resource "aws_ses_domain_identity_verification" "domain_verification" {
  domain     = var.cloudflare_zone.zone
  depends_on = [cloudflare_record.dkim]
}

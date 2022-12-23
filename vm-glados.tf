# DNS
resource "cloudflare_record" "glados_djm_me_A" {
  zone_id = cloudflare_zone.djm_me.id
  name    = "glados"
  type    = "A"
  value   = "192.168.5.2"
}

resource "cloudflare_record" "glados_djm_me_TXT_spf" {
  zone_id = cloudflare_zone.djm_me.id
  name    = "glados"
  type    = "TXT"
  value   = "v=spf1 include:spf.messagingengine.com a:home.djm.me -all"
}

resource "cloudflare_record" "STAR_glados_djm_me_CNAME" {
  zone_id = cloudflare_zone.djm_me.id
  name    = "*.glados"
  type    = "CNAME"
  value   = "glados.djm.me"
}

# SES
resource "aws_iam_user" "ses_glados" {
  name = "glados-ses-postfix-user"
}

resource "aws_iam_user_policy" "ses_glados" {
  name = "glados-ses-postfix-policy"
  user = aws_iam_user.ses_glados.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid      = "SystemNotifications"
        Effect   = "Allow"
        Action   = ["ses:SendRawEmail"]
        Resource = "*"

        Condition = {
          # Can't restrict the source IP because this is on my laptop
          StringLike = {
            "ses:FromAddress" = [
              "*@glados.djm.me",
            ]
          }
        }
      }
    ]
  })
}

resource "aws_iam_access_key" "ses_glados" {
  user = aws_iam_user.ses_glados.name
}

output "glados_ses_username" {
  description = "The username to configure in Ansible for use in Postfix"
  value       = aws_iam_access_key.ses_glados.id
}

output "glados_ses_password" {
  description = "The password to configure in Ansible for use in Postfix"
  value       = aws_iam_access_key.ses_glados.ses_smtp_password_v4
  sensitive   = true
}

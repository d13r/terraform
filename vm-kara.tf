# DNS
resource "cloudflare_record" "kara_djm_me_A" {
  zone_id = cloudflare_zone.djm_me.id
  name    = "kara"
  type    = "A"
  value   = "192.168.5.3"
}

resource "cloudflare_record" "kara_djm_me_TXT_spf" {
  zone_id = cloudflare_zone.djm_me.id
  name    = "kara"
  type    = "TXT"
  value   = "v=spf1 include:spf.messagingengine.com a:home.djm.me -all"
}

resource "cloudflare_record" "STAR_kara_djm_me_CNAME" {
  zone_id = cloudflare_zone.djm_me.id
  name    = "*.kara"
  type    = "CNAME"
  value   = "kara.djm.me"
}

# SES
resource "aws_iam_user" "ses_kara" {
  name = "kara-ses-postfix-user"
}

resource "aws_iam_user_policy" "ses_kara" {
  name = "kara-ses-postfix-policy"
  user = aws_iam_user.ses_kara.name

  policy = jsonencode({
    Version   = "2012-10-17"
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
              "*@kara.djm.me",
            ]
          }
        }
      }
    ]
  })
}

resource "aws_iam_access_key" "ses_kara" {
  user = aws_iam_user.ses_kara.name
}

output "kara_ses_username" {
  description = "The username to configure in Ansible for use in Postfix"
  value = aws_iam_access_key.ses_kara.id
}

output "kara_ses_password" {
  description = "The password to configure in Ansible for use in Postfix"
  value = aws_iam_access_key.ses_kara.ses_smtp_password_v4
  sensitive = true
}

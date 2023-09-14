module "aws_ses_domain-djm_me" {
  source          = "./modules/aws_ses_domain"
  cloudflare_zone = data.cloudflare_zone.djm_me
}

# For sending to while in sandbox
resource "aws_ses_email_identity" "work_email" {
  email = "dave.miller@maths.ox.ac.uk"
}

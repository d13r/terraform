module "aws_ses_djm_me" {
  source          = "./modules/aws-ses-domain"
  cloudflare_zone = cloudflare_zone.djm_me
}

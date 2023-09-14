data "cloudflare_zone" "djm_me" {
  name = "djm.me"
}

resource "cloudflare_record" "test_djm_me_TXT" {
  zone_id = data.cloudflare_zone.djm_me.zone_id
  name    = "test"
  type    = "TXT"
  value   = "Test from Terraform"
}

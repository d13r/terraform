resource "cloudflare_record" "susan_djm_me" {
  zone_id = data.cloudflare_zone.djm_me.zone_id
  name    = "susan"
  type    = "CNAME"
  value   = "u369343.your-storagebox.de"
  comment = local.managed_comment
}

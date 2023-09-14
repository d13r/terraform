resource "cloudflare_record" "bin-cli_com" {
  zone_id = data.cloudflare_zone.bin-cli_com.zone_id
  name    = "@"
  type    = "CNAME" # Flattened
  value   = "bin-cli.netlify.app"
  comment = local.managed_comment
}

resource "cloudflare_record" "www_bin-cli_com" {
  zone_id = data.cloudflare_zone.bin-cli_com.zone_id
  name    = "www"
  type    = "CNAME"
  value   = "bin-cli.netlify.app"
  comment = local.managed_comment
}

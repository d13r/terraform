resource "cloudflare_record" "public_A_record" {
  zone_id = var.cloudflare_zone.zone_id
  name    = var.name
  type    = "A"
  value   = "88.99.150.13"
  comment = var.managed_comment
}

resource "cloudflare_record" "public_AAAA_record" {
  zone_id = var.cloudflare_zone.zone_id
  name    = var.name
  type    = "AAAA"
  value   = format("2a01:4f8:10a:2e4b:%x::", var.number)
  comment = var.managed_comment
}

resource "cloudflare_record" "private_A_record" {
  zone_id = var.cloudflare_zone.zone_id
  name    = "private.${var.name}"
  type    = "A"
  value   = format("192.168.150.%d", var.number)
  comment = var.managed_comment
}

resource "cloudflare_record" "private_AAAA_record" {
  zone_id = var.cloudflare_zone.zone_id
  name    = "private.${var.name}"
  type    = "AAAA"
  value   = format("2a01:4f8:10a:2e4b:%x::", var.number)
  comment = var.managed_comment
}

resource "cloudflare_record" "wildcard" {
  zone_id = var.cloudflare_zone.zone_id
  name    = "*.${var.name}"
  type    = "CNAME"
  value   = "${var.name}.${var.cloudflare_zone.name}"
  comment = var.managed_comment
}

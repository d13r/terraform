#===============================================================================
# Windows
#===============================================================================

resource "cloudflare_record" "chell_djm_me" {
  zone_id = data.cloudflare_zone.djm_me.zone_id
  name    = "chell"
  type    = "A"
  value   = "127.0.0.1"
  comment = local.managed_comment
}

resource "cloudflare_record" "STAR_chell_djm_me" {
  zone_id = data.cloudflare_zone.djm_me.zone_id
  name    = "*.chell"
  type    = "CNAME"
  value   = "chell.djm.me"
  comment = local.managed_comment
}

#---------------------------------------
# Hyper-V VMs (192.168.5.X)
#---------------------------------------
# 192.168.5.1 is reserved for the host

resource "cloudflare_record" "kara_djm_me" {
  zone_id = data.cloudflare_zone.djm_me.zone_id
  name    = "kara"
  type    = "A"
  value   = "192.168.5.2"
  comment = local.managed_comment
}

resource "cloudflare_record" "STAR_kara_djm_me" {
  zone_id = data.cloudflare_zone.djm_me.zone_id
  name    = "*.kara"
  type    = "CNAME"
  value   = "kara.djm.me"
  comment = local.managed_comment
}

#===============================================================================
# Linux
#===============================================================================

resource "cloudflare_record" "june_djm_me" {
  zone_id = data.cloudflare_zone.djm_me.zone_id
  name    = "june"
  type    = "A"
  value   = "127.0.0.1"
  comment = local.managed_comment
}

resource "cloudflare_record" "STAR_june_djm_me" {
  zone_id = data.cloudflare_zone.djm_me.zone_id
  name    = "*.june"
  type    = "CNAME"
  value   = "june.djm.me"
  comment = local.managed_comment
}

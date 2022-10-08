resource "aws_route53domains_registered_domain" "djm_me" {
  domain_name = "djm.me"

  name_server {
    name = cloudflare_zone.djm_me.name_servers[0]
  }
  name_server {
    name = cloudflare_zone.djm_me.name_servers[1]
  }
}

resource "aws_route53domains_registered_domain" "davejamesmiller_com" {
  domain_name = "davejamesmiller.com"

  name_server {
    name = cloudflare_zone.davejamesmiller_com.name_servers[0]
  }
  name_server {
    name = cloudflare_zone.davejamesmiller_com.name_servers[1]
  }
}

resource "aws_route53domains_registered_domain" "d13r_uk" {
  domain_name = "d13r.uk"
  transfer_lock = false # Not supported for UK domains

  name_server {
    name = cloudflare_zone.d13r_uk.name_servers[0]
  }
  name_server {
    name = cloudflare_zone.d13r_uk.name_servers[1]
  }
}

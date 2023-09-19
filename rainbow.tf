module "rainbow_vm-rainbow" {
  # This one is the host, not a VM, but it has the same DNS records
  source          = "./modules/rainbow_vm"
  cloudflare_zone = data.cloudflare_zone.djm_me
  number          = 1
  name            = "rainbow"
  managed_comment = local.managed_comment
}

module "rainbow_vm-red" {
  source          = "./modules/rainbow_vm"
  cloudflare_zone = data.cloudflare_zone.djm_me
  number          = 2
  name            = "red"
  managed_comment = local.managed_comment
}

module "rainbow_vm-orange" {
  source          = "./modules/rainbow_vm"
  cloudflare_zone = data.cloudflare_zone.djm_me
  number          = 3
  name            = "orange"
  managed_comment = local.managed_comment
}

module "rainbow_vm-yellow" {
  source          = "./modules/rainbow_vm"
  cloudflare_zone = data.cloudflare_zone.djm_me
  number          = 4
  name            = "yellow"
  managed_comment = local.managed_comment
}

module "rainbow_vm-green" {
  source          = "./modules/rainbow_vm"
  cloudflare_zone = data.cloudflare_zone.djm_me
  number          = 5
  name            = "green"
  managed_comment = local.managed_comment
}

module "rainbow_vm-cyan" {
  source          = "./modules/rainbow_vm"
  cloudflare_zone = data.cloudflare_zone.djm_me
  number          = 6
  name            = "cyan"
  managed_comment = local.managed_comment
}

module "rainbow_vm-blue" {
  source          = "./modules/rainbow_vm"
  cloudflare_zone = data.cloudflare_zone.djm_me
  number          = 7
  name            = "blue"
  managed_comment = local.managed_comment
}

module "rainbow_vm-violet" {
  source          = "./modules/rainbow_vm"
  cloudflare_zone = data.cloudflare_zone.djm_me
  number          = 8
  name            = "violet"
  managed_comment = local.managed_comment
}

module "rainbow_vm-white" {
  source          = "./modules/rainbow_vm"
  cloudflare_zone = data.cloudflare_zone.djm_me
  number          = 9
  name            = "white"
  managed_comment = local.managed_comment
}

module "rainbow_vm-black" {
  source          = "./modules/rainbow_vm"
  cloudflare_zone = data.cloudflare_zone.djm_me
  number          = 10
  name            = "black"
  managed_comment = local.managed_comment
}

module "rainbow_vm-gold" {
  source          = "./modules/rainbow_vm"
  cloudflare_zone = data.cloudflare_zone.djm_me
  number          = 11
  name            = "gold"
  managed_comment = local.managed_comment
}

module "rainbow_vm-silver" {
  source          = "./modules/rainbow_vm"
  cloudflare_zone = data.cloudflare_zone.djm_me
  number          = 12
  name            = "silver"
  managed_comment = local.managed_comment
}

module "rainbow_vm-bronze" {
  source          = "./modules/rainbow_vm"
  cloudflare_zone = data.cloudflare_zone.djm_me
  number          = 13
  name            = "bronze"
  managed_comment = local.managed_comment
}

module "rainbow_vm-magenta" {
  source          = "./modules/rainbow_vm"
  cloudflare_zone = data.cloudflare_zone.djm_me
  number          = 14
  name            = "magenta"
  managed_comment = local.managed_comment
}

module "rainbow_vm-indigo" {
  source          = "./modules/rainbow_vm"
  cloudflare_zone = data.cloudflare_zone.djm_me
  number          = 15
  name            = "indigo"
  managed_comment = local.managed_comment
}

resource "cloudflare_record" "rainbox_djm_me" {
  zone_id = data.cloudflare_zone.djm_me.zone_id
  name    = "rainbox"
  type    = "CNAME"
  value   = "u364797.your-storagebox.de"
  comment = local.managed_comment
}

# Services
resource "cloudflare_record" "dhcp_djm_me" {
  zone_id = data.cloudflare_zone.djm_me.zone_id
  name    = "dhcp"
  type    = "CNAME"
  value   = "orange.djm.me"
  comment = local.managed_comment
}

resource "cloudflare_record" "puppet_djm_me" {
  zone_id = data.cloudflare_zone.djm_me.zone_id
  name    = "puppet"
  type    = "CNAME"
  value   = "cyan.djm.me"
  comment = local.managed_comment
}

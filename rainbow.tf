module "rainbow_vm-rainbow" {
  # This one is the host, not a VM, but it has the same DNS records
  source          = "./modules/rainbow_vm"
  cloudflare_zone = data.cloudflare_zone.djm_me
  number          = 1
  name            = "rainbow"
}

module "rainbow_vm-red" {
  source          = "./modules/rainbow_vm"
  cloudflare_zone = data.cloudflare_zone.djm_me
  number          = 2
  name            = "red"
}

module "rainbow_vm-orange" {
  source          = "./modules/rainbow_vm"
  cloudflare_zone = data.cloudflare_zone.djm_me
  number          = 3
  name            = "orange"
}

module "rainbow_vm-yellow" {
  source          = "./modules/rainbow_vm"
  cloudflare_zone = data.cloudflare_zone.djm_me
  number          = 4
  name            = "yellow"
}

module "rainbow_vm-green" {
  source          = "./modules/rainbow_vm"
  cloudflare_zone = data.cloudflare_zone.djm_me
  number          = 5
  name            = "green"
}

module "rainbow_vm-cyan" {
  source          = "./modules/rainbow_vm"
  cloudflare_zone = data.cloudflare_zone.djm_me
  number          = 6
  name            = "cyan"
}

module "rainbow_vm-blue" {
  source          = "./modules/rainbow_vm"
  cloudflare_zone = data.cloudflare_zone.djm_me
  number          = 7
  name            = "blue"
}

module "rainbow_vm-violet" {
  source          = "./modules/rainbow_vm"
  cloudflare_zone = data.cloudflare_zone.djm_me
  number          = 8
  name            = "violet"
}

module "rainbow_vm-white" {
  source          = "./modules/rainbow_vm"
  cloudflare_zone = data.cloudflare_zone.djm_me
  number          = 9
  name            = "white"
}

module "rainbow_vm-black" {
  source          = "./modules/rainbow_vm"
  cloudflare_zone = data.cloudflare_zone.djm_me
  number          = 10
  name            = "black"
}

module "rainbow_vm-gold" {
  source          = "./modules/rainbow_vm"
  cloudflare_zone = data.cloudflare_zone.djm_me
  number          = 11
  name            = "gold"
}

module "rainbow_vm-silver" {
  source          = "./modules/rainbow_vm"
  cloudflare_zone = data.cloudflare_zone.djm_me
  number          = 12
  name            = "silver"
}

module "rainbow_vm-bronze" {
  source          = "./modules/rainbow_vm"
  cloudflare_zone = data.cloudflare_zone.djm_me
  number          = 13
  name            = "bronze"
}

module "rainbow_vm-magenta" {
  source          = "./modules/rainbow_vm"
  cloudflare_zone = data.cloudflare_zone.djm_me
  number          = 14
  name            = "magenta"
}

module "rainbow_vm-indigo" {
  source          = "./modules/rainbow_vm"
  cloudflare_zone = data.cloudflare_zone.djm_me
  number          = 15
  name            = "indigo"
}

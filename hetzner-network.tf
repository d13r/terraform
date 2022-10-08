resource "hcloud_network" "djm_private" {
  name     = "djm-private"
  ip_range = "10.3.56.0/24" # 365 = DJM on a phone keypad
}

resource "hcloud_network_subnet" "djm_private_eu_central" {
  network_id   = hcloud_network.djm_private.id
  type         = "cloud"
  network_zone = "eu-central"
  ip_range     = "10.3.56.0/28"
}

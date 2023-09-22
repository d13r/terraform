variable "cloudflare_api_token" {
  type        = string
  description = "CloudFlare API token - https://dash.cloudflare.com/profile/api-tokens"
  sensitive   = true
}

variable "hcloud_token" {
  type        = string
  description = "Hetzner Cloud API token - https://console.hetzner.cloud/projects/1411940/security/tokens"
  sensitive   = true
}

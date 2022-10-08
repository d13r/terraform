variable "cloudflare_zone" {
  type = object({
    id = string
    zone = string
  })
}

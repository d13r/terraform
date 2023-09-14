variable "number" {
  type = number
}

variable "name" {
  type = string
}

variable "cloudflare_zone" {
  type = object({
    zone_id = string
  })
}

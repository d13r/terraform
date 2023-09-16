variable "number" {
  type = number
}

variable "name" {
  type = string
}

variable "cloudflare_zone" {
  type = object({
    zone_id = string
    name = string
  })
}

variable "managed_comment" {
  type = string
}

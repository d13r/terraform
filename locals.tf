locals {
  managed_by      = "github.com/d13r/terraform"
  managed_comment = "Managed by ${local.managed_by}"
  public_ips      = ["0.0.0.0/0", "::/0"]
}

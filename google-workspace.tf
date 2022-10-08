# This is legacy, so it's not worth me setting up the Google Workspace provider just to fetch the key automatically
# https://admin.google.com/u/1/ac/apps/gmail/authenticateemail
resource "cloudflare_record" "google_domainkey_davejamesmiller_com" {
  zone_id = cloudflare_zone.davejamesmiller_com.id
  name    = "google._domainkey"
  type    = "TXT"
  value   = "v=DKIM1; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCY5iAlN3IKVEBlXoEqg3RKBlsY2LMdl21F3jr82TAeLbNqCp4jH1XNf0OH6EZ/vSDsakoiCAcNu1c7a4p6MMxQhJqeYYDIRYc13i6JgmaBbKlgeWYC8mucJZ52MdX3L7idXryQRnbSbnC9uCKzL7XKZOzdZcToeHZBm+AoFTqTkwIDAQAB"
}

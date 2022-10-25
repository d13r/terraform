resource "cloudflare_record" "blog_djm_me_CNAME" {
  zone_id = cloudflare_zone.djm_me.id
  name    = "blog"
  type    = "CNAME"
  value   = "djm-blog.netlify.app"
}

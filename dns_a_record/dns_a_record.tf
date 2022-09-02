variable  "zone_id"  {} 
variable  "domain"   {}
variable  "tag"      {}
variable  "ip"       {}

//create hosted zone for domain, this automatically generates NS and SOA records
resource "aws_route53_record" "nameservers" {
  zone_id           = var.zone_id
  name              = var.domain
  type              = "A"
  ttl               = "300"
  records           = var.ip
}
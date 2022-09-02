variable "domain"       {}
variable "tag"          {}
variable "nameservers"  {}

//create hosted zone for domain, this automatically generates NS and SOA records
resource  "aws_route53_zone" "dns_zone"  {
    name            = var.domain

    tags            = {
        Environment = var.tag
    }
}

//create 
resource "aws_route53_record" "nameservers" {
  zone_id           = aws_route53_zone.dns_zone.zone_id
  name              = var.domain
  type              = "NS"
  ttl               = "30"
  records           = var.nameservers != null ? var.nameservers : aws_route53_zone.dns_zone.name_servers
  allow_overwrite   = true
}

//output zone id and nameserers to main configuration
output "zone_id" {
    value           = aws_route53_zone.dns_zone.zone_id

}
output "nameservers" {
    value           = aws_route53_zone.dns_zone.name_servers
}
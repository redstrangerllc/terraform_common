variable  "domain"      {}
variable  "subdomain"   {}
variable  "eip"         {}
variable  "zone_id"     {} 

resource "aws_route53_record" "dns_entry" {
    
    zone_id             = "${var.zone_id}"
    name                = "${var.subdomain}.${var.domain}"
    type                = "A"
    ttl                 = "300"

    records = [
        "${var.eip}"
    ]
}
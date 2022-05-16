variable  "domain"      {}
variable  "eip"         {}
variable  "zone_id"     {} 

resource "aws_route53_record" "mail-a" {
    zone_id             = "${var.zone_id}"
    name                = "${var.domain}"
    type                = "A"
    ttl                 = "300"

    records = [
        "${var.eip}"
    ]
}

resource "aws_route53_record" "mail-mx" {
    
    zone_id             = "${var.zone_id}"
    name                = "mail.${var.domain}"
    type                = "MX"
    ttl                 = "300"

    records = [
        "${var.eip}"
    ]
}
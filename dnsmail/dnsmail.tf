variable  "domain"      {}
variable  "eip"         {}
variable  "zone_id"     {} 

//generate A record for mailserver
resource "aws_route53_record" "mail-a" {
    zone_id             = "${var.zone_id}"
    name                = "mail.${var.domain}"
    type                = "A"
    ttl                 = "300"

    records = [
        "${var.eip}"
    ]
}

//generate MX record for mailserver
resource "aws_route53_record" "mail-mx" {
    
    zone_id             = "${var.zone_id}"
    name                = "mail.${var.domain}"
    type                = "MX"
    ttl                 = "300"

    records = [
        "10 mail.${var.domain}"
    ]
}

//